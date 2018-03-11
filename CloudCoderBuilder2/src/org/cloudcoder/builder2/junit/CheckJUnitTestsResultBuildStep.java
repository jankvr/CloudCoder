package org.cloudcoder.builder2.junit;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import org.cloudcoder.app.shared.model.CompilationOutcome;
import org.cloudcoder.app.shared.model.CompilationResult;
import org.cloudcoder.app.shared.model.Problem;
import org.cloudcoder.app.shared.model.SubmissionResult;
import org.cloudcoder.app.shared.model.TestOutcome;
import org.cloudcoder.app.shared.model.TestResult;
import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.CommandResult;
import org.cloudcoder.builder2.model.IBuildStep;
import org.cloudcoder.builder2.model.JUnitResult;
import org.cloudcoder.builder2.util.SubmissionResultUtil;

public class CheckJUnitTestsResultBuildStep implements IBuildStep {

	private static final String RESULT = "RESULT";
	private static final String ERROR = "ERROR";
	private static final String CODE_COVERAGE = "CODE_COVERAGE";
	private List<String> errors = new ArrayList<>();
	private String testResult;
	private String codeCoverage;
	
	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		Problem problem = submission.requireArtifact(this.getClass(), Problem.class);
		
		if (problem == null) {
			submission.addArtifact(SubmissionResultUtil.createSubmissionResultForUnexpectedBuildError(
					"There is no problem to resolve."));
		}
		
		double minimumCoverage = (double) problem.getMinimumCoverage();
		
		CommandResult[] results = submission.requireArtifact(this.getClass(), CommandResult[].class);
		
		if (results == null || results.length <= 0) {
			submission.addArtifact(SubmissionResultUtil.createSubmissionResultForUnexpectedBuildError(
					"No results returned."));
		}
		
		CommandResult result = results[0];
		
		JUnitResult jUnitResult = populateResultLists(result);
		
		
		// Create submission result
		SubmissionResult submissionResult = new SubmissionResult();
		
		CompilationResult compilationResult = submission.getArtifact(CompilationResult.class);
		if (compilationResult == null) {
			// Create a dummy sucess CompilationResult
			compilationResult = new CompilationResult(CompilationOutcome.SUCCESS);
		}
		submissionResult.setCompilationResult(compilationResult);
		
		double coverage = 0;
		
		if (jUnitResult != null) {
			coverage = jUnitResult.getCodeCoveragePercentage();
		}
		
        DecimalFormat df = new DecimalFormat("#.#");
        String formatedCoverage = df.format(coverage);
		
		if (jUnitResult != null && jUnitResult.getResult() && jUnitResult.getCodeCoveragePercentage() >= minimumCoverage) {
			// Create the TestResult list
			TestOutcome outcome = TestOutcome.PASSED;
			
			TestResult testResult = new TestResult(outcome, "Test passed with coverage of " + formatedCoverage + " %");
			testResult.setStdout("Test passed with coverage of " + formatedCoverage + " %");
			testResult.setStderr("");
			TestResult[] testResultList = new TestResult[] { testResult };
			submissionResult.setTestResults(testResultList);
			
			// Adding the SubmissionResult artifact completes building/testing for this submission
			submission.addArtifact(submissionResult);
		}
		else {
			int size = jUnitResult.getErrors().size() + 2;
			List<TestResult> testResultList = new ArrayList<TestResult>();
			
			TestResult jUnitResultFlag = jUnitResult.getResult() 
					? new TestResult(TestOutcome.PASSED, "Test passed.")
					: new TestResult(TestOutcome.FAILED_ASSERTION, "Test didn't pass.");
			TestResult jUnitResultCoverage = coverage >= minimumCoverage
					? new TestResult(TestOutcome.PASSED, "Minimum code coverage: " + minimumCoverage + " %. Your code coverage is " + formatedCoverage + " %.")
					: new TestResult(TestOutcome.FAILED_ASSERTION, "Minimum code coverage: " + minimumCoverage + " %. Your code coverage is " + formatedCoverage + " %.");
			
			jUnitResultFlag.setStdout(jUnitResultFlag.getOutcome() == TestOutcome.PASSED ? "Test passed." : "Test didn't pass.");
			jUnitResultCoverage.setStdout(jUnitResultCoverage.getOutcome() == TestOutcome.PASSED ? "Test passed." : "Test didn't pass.");
			
			StringBuilder sb = new StringBuilder();
			for (String error : jUnitResult.getErrors()) {
				TestResult errorResult = new TestResult(TestOutcome.FAILED_ASSERTION, error);
				errorResult.setStdout(error);
				errorResult.setStderr(error);
				testResultList.add(errorResult);
				sb.append(error);
				sb.append(" ");
			}
			
			jUnitResultFlag.setStderr(sb.toString());
			jUnitResultCoverage.setStderr(sb.toString());
			
			testResultList.add(jUnitResultFlag);
			testResultList.add(jUnitResultCoverage);
			
			TestResult[] convertedTestResultList = new TestResult[size];
			convertedTestResultList = testResultList.toArray(convertedTestResultList);
			
			submissionResult.setTestResults(convertedTestResultList);
			
			// Clear errors
			errors.clear();
			
			// Adding the SubmissionResult artifact completes building/testing for this submission
			submission.addArtifact(submissionResult);
		}
		
	}
	
	private JUnitResult populateResultLists(CommandResult result) {
		List<String> output = result.getStdout();
		
		for (String out : output) {
			// Try to find a keyword
			String[] delimOutputs = out.split(";");
			
			for (String singleOut : delimOutputs) {
				String value = null;
				
				if (singleOut.contains(RESULT)) {
					value = singleOut.replace(RESULT + ":", "");
					this.testResult = value.trim();
				}
				else if (singleOut.contains(ERROR)) {
					value = singleOut.replace(ERROR + ":", "");
					errors.add(value.trim());
				}
				else if (singleOut.contains(CODE_COVERAGE)) {
					value = singleOut.replace(CODE_COVERAGE + ":", "");
					this.codeCoverage = value.trim();
				}
			}
		}
		
		JUnitResult jUnitResult = null;
		
		try {
			double parsedCodeCoverage = Double.parseDouble(codeCoverage);
			boolean parsedResult = Boolean.parseBoolean(testResult);
			
			jUnitResult = new JUnitResult(errors, parsedResult, parsedCodeCoverage);
		}
		catch (Exception e) {
			// Just throw this exception away
		}
		
		return jUnitResult;
	}
}

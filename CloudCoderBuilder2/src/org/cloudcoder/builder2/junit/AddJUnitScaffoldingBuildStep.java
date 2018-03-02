package org.cloudcoder.builder2.junit;

import java.util.Properties;

import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.IBuildStep;
import org.cloudcoder.builder2.model.InternalBuilderException;
import org.cloudcoder.builder2.model.ProgramSource;
//import org.cloudcoder.app.shared.model.ProblemType;

public class AddJUnitScaffoldingBuildStep implements IBuildStep {

	private static final String RUNNER_CODE = 
			"import org.junit.runner.JUnitCore;\n" + 
			"import org.junit.runner.Result;\n" + 
			"import org.junit.runner.notification.Failure;\n\n" + 
			"public class TestRunner {\n" +
			"	public static void main(String[] args) {\n" +
			"		Result result = JUnitCore.runClasses(TestJunit.class);\n" + 
		    "		for (Failure failure : result.getFailures()) {\n" + 
		    "			System.out.println(\"ERROR:\" + failure.toString());\n" + 
		    "		}\n" + 
		    "		System.out.println(\"RESULT:\" + result.wasSuccessful());\n" +
			"	}\n" +
			"}\n";
	
	private static final String CLASS_HEADER_START = 
			"import org.junit.*;" + 
			"import org.junit.Test;" + 
			"import static org.junit.Assert.*;\n\n" + 
			"public class TestJunit {\n";
	private static final String CLASS_HEADER_END = "}\n";
	private static final String NEW_LINE = "\n";
	
	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		ProgramSource[] programSourceList = submission.requireArtifact(this.getClass(), ProgramSource[].class);
		
		if (programSourceList == null || programSourceList.length > 1) {
			throw new InternalBuilderException(this.getClass(), "There must be just 1 source file while using JUnit testing.");
		}

		ProgramSource programSource = programSourceList[0];
		
		StringBuilder test = new StringBuilder();
		test.append(CLASS_HEADER_START);
		test.append(programSource.getProgramText() + NEW_LINE);
		test.append(CLASS_HEADER_END);
		
		// Not sure what are exactly these numbers
		ProgramSource scaffoldedProgramSource = new ProgramSource(test.toString(), 1, 2);
		ProgramSource runnerSource = getRunner();
		
		submission.addArtifact(new ProgramSource[] { runnerSource, scaffoldedProgramSource });
		
	}
	
	private ProgramSource getRunner() {
		return new ProgramSource(RUNNER_CODE, 1, 2);
	}

}

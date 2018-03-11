package org.cloudcoder.builder2.junit;

import java.util.Properties;

import org.cloudcoder.app.shared.model.Problem;
import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.CommandResult;
import org.cloudcoder.builder2.model.IBuildStep;
import org.cloudcoder.builder2.model.InternalBuilderException;
import org.cloudcoder.builder2.model.ProgramSource;
import org.cloudcoder.builder2.util.SubmissionResultUtil;

public class ValidateJUnitTestBuildStep implements IBuildStep {

	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		// Parse skeleton text and trim it
		// Check if there is any change in skeleton text
		
		Problem problem = submission.requireArtifact(this.getClass(), Problem.class);
		
		ProgramSource[] programSourceList = submission.requireArtifact(this.getClass(), ProgramSource[].class);
		
		if (programSourceList == null || programSourceList.length > 1) {
			throw new InternalBuilderException(this.getClass(), "There must be just 1 source file while using JUnit testing.");
		}
		else if (problem == null) {
			throw new InternalBuilderException(this.getClass(), "There must be a problem to test.");
		}

		ProgramSource programSource = programSourceList[0];
		
		String skeletonCode = problem.getSkeleton();
		
		if (!programSource.getProgramText().contains(skeletonCode)) {
			submission.addArtifact(SubmissionResultUtil.createSubmissionResultForUnexpectedBuildError(
					"There is a change in skeleton code. Reset the problem."));
		}
	}

}

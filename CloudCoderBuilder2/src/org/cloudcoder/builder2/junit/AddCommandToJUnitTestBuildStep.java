package org.cloudcoder.builder2.junit;

import java.util.Properties;

import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.CommandInput;
import org.cloudcoder.builder2.model.IBuildStep;

public class AddCommandToJUnitTestBuildStep implements IBuildStep {

	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		submission.addArtifact(new CommandInput[] { new CommandInput("") });
	}

}

package org.cloudcoder.builder2.junit;

import java.util.Properties;

import org.cloudcoder.app.shared.model.Commands;
import org.cloudcoder.app.shared.model.Problem;
import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.IBuildStep;
import org.cloudcoder.builder2.model.InternalBuilderException;
import org.cloudcoder.builder2.model.ProgramSource;
import org.codeanalyser.CodeAnalyser;
import org.codeanalyser.CodeCoverage;
import org.codeanalyser.model.EmptyListException;

public class EditSkeletonCodeBuildStep implements IBuildStep {

	public static final String ANALYSER_NAME = "__ANALYSER_JUNIT__";
	
	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		// Get skeleton code
		Problem problem = submission.requireArtifact(this.getClass(), Problem.class);
		
		if (problem == null) {
			throw new InternalBuilderException(this.getClass(), "There must be a problem to test.");
		}
		
		String skeletonCode = problem.getSkeleton();
		
		// Create analyser
		CodeAnalyser codeAnalyser = new CodeAnalyser(skeletonCode, ANALYSER_NAME);
		
		codeAnalyser.analyse();
		
		Commands commands = new Commands(codeAnalyser.getCommandCount());
		
		String editedCode = null;
		
		try {
			editedCode = codeAnalyser.editCode();
		} catch (EmptyListException e) {
			throw new InternalBuilderException(this.getClass(), "There is a problem with editting code." + e.getStackTrace());
		}
		
		// Require source code artifact
		ProgramSource[] programSourceList = submission.requireArtifact(this.getClass(), ProgramSource[].class);
		
		if (programSourceList == null || programSourceList.length > 1) {
			throw new InternalBuilderException(this.getClass(), "There must be just 1 source file while using JUnit testing.");
		}
		
		String programCode = programSourceList[0].getProgramText();
		
		String solutionSource = programCode.replace(skeletonCode, "").trim();
		
		StringBuilder sb = new StringBuilder();
		sb.append(editedCode);
		sb.append("\n\n");
		sb.append(solutionSource);
		String newSource = sb.toString();
		
		ProgramSource programSource = new ProgramSource(newSource);
		
		submission.addArtifact(new ProgramSource[] { programSource });
		submission.addArtifact(commands);
	}

}

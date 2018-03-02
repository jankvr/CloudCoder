package org.cloudcoder.builder2.junit;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.BytecodeExecutable;
import org.cloudcoder.builder2.model.Command;
import org.cloudcoder.builder2.model.CommandInput;
import org.cloudcoder.builder2.model.ExternalLibrary;
import org.cloudcoder.builder2.model.IBuildStep;
import org.cloudcoder.builder2.model.InternalBuilderException;

public class JUnitToCommandForEachCommandInputBuildStep implements IBuildStep {

	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		BytecodeExecutable bytecodeExe = submission.requireArtifact(this.getClass(), BytecodeExecutable.class);
		CommandInput[] commandInputList = submission.requireArtifact(this.getClass(), CommandInput[].class);
		
		Command[] commandList = new Command[commandInputList.length];
		
		ExternalLibrary[] extLib = submission.getArtifact(ExternalLibrary[].class);
		if (extLib != null) {
			for (int i = 0; i < extLib.length; i++) {
				if (!extLib[i].isAvailable()) {
					throw new InternalBuilderException(this.getClass(), "Should not happen: external library " + extLib[i].getFileName() + " is not available");
				}
			}
		}
		
		for (int i = 0; i < commandInputList.length; i++) {
			List<String> arguments = new ArrayList<String>();
			arguments.add("java");
			arguments.add("-cp");
			
			// If there is an external library, add it to our runtime classpath
			if (extLib != null) {
				StringBuilder sb = new StringBuilder();
				sb.append(".");
				for (int j = 0; j < extLib.length; j++) {
					sb.append(":");
					sb.append(extLib[j].getUrl());
				}
				
				arguments.add(sb.toString());
			}
			// Or just add dot
			else {
				arguments.add(".");
			}
			
			arguments.add(bytecodeExe.getMainClass());
			
			commandList[i] = new Command(bytecodeExe.getDir(), arguments);
		}
		
		submission.addArtifact(commandList);
	}

}

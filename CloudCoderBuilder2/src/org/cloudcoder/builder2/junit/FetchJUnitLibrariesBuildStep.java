package org.cloudcoder.builder2.junit;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Properties;

import org.apache.commons.io.IOUtils;
import org.cloudcoder.app.shared.model.SubmissionResult;
import org.cloudcoder.builder2.model.BuilderSubmission;
import org.cloudcoder.builder2.model.BytecodeExecutable;
import org.cloudcoder.builder2.model.ExternalLibrary;
import org.cloudcoder.builder2.model.IBuildStep;
import org.cloudcoder.builder2.model.InternalBuilderException;
import org.cloudcoder.builder2.util.SubmissionResultUtil;
import org.python.google.common.io.ByteStreams;

public class FetchJUnitLibrariesBuildStep implements IBuildStep {

	private HashMap<ExternalLibrary, byte[]> map;
	
	@Override
	public void execute(BuilderSubmission submission, Properties config) {
		map = new HashMap<ExternalLibrary, byte[]>();
		ExternalLibrary junitLib = new ExternalLibrary(false, "libs/junit-4.12.jar", "", "junit-4.12.jar");
		ExternalLibrary hamcrestLib = new ExternalLibrary(false, "libs/hamcrest-core-1.3.jar", "", "hamcrest-core-1.3.jar");
		ExternalLibrary codeAnalyserLib = new ExternalLibrary(false, "libs/codeanalyser-1.2.jar", "", "codeanalyser-1.2.jar");
		
		this.putIntoMap(junitLib, submission);
		this.putIntoMap(hamcrestLib, submission);
		this.putIntoMap(codeAnalyserLib, submission);
		
		submission.addArtifact(new ExternalLibrary[] { junitLib, hamcrestLib, codeAnalyserLib });
		
	}
	
	private void putIntoMap(ExternalLibrary extLibrary, BuilderSubmission submission) {
		if (extLibrary == null || map == null) {
			return;
		}
		
		InputStream stream = null;
		byte[] byteArray = null;
		
		try {
			stream = this.getClass().getResourceAsStream(extLibrary.getUrl());
			byteArray = ByteStreams.toByteArray(stream);
			
			// Create new file
			File out = new File(this.getDir(submission), extLibrary.getUrl());
			// Create parent folders if needed
			File parentFile = out.getParentFile();
			parentFile.mkdirs();
			
			FileOutputStream os = null;
			try {
				os = new FileOutputStream(out);
				IOUtils.copy(new ByteArrayInputStream(byteArray), os);
			}
			catch (IOException e) {
				SubmissionResult result = SubmissionResultUtil.createSubmissionResultForUnexpectedBuildError(
						"Error writing .jar file: " + e.getMessage());
				submission.addArtifact(result);
				return;
			}
			finally {
				IOUtils.closeQuietly(os);
			}
			extLibrary.setAvailable(true);
			map.put(extLibrary, byteArray);
		}
		catch (Throwable e) {
			throw new InternalBuilderException(this.getClass(), 
					"Should not happen: external library is not available");
		}
	}
	
	private File getDir(BuilderSubmission submission) {
		BytecodeExecutable bytecodeExe = submission.requireArtifact(this.getClass(), BytecodeExecutable.class);
		
		if (bytecodeExe == null) {
			submission.addArtifact(SubmissionResultUtil.createSubmissionResultForUnexpectedBuildError(
					"Couldn't retrieve bytecode"));
			return null;
		}
		
		File tmpDir = bytecodeExe.getDir();
		
		if (tmpDir == null) {
			submission.addArtifact(SubmissionResultUtil.createSubmissionResultForUnexpectedBuildError(
					"Should not happen: temporary directory was not created."));
			return null;
		}
		
		return tmpDir;
	}
}

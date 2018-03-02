package org.cloudcoder.builder2.junit;

import java.io.IOException;
import java.io.InputStream;

import com.google.common.io.ByteStreams;

class FileLoader {
	
	
	public InputStream loadFile() {
		InputStream stream = null;
		
		try {
			stream = FileLoader.class.getResourceAsStream("./libs/junit-4.12.jar");
		}
		finally { }
		
		return stream;
	}
}

public class Temp {

	
	
	
	public static void main(String[] args) throws IOException {
		FileLoader fl = new FileLoader();
		
		InputStream file = fl.loadFile();
		
		byte[] arr = null;
		
		if (file != null) {
			arr = ByteStreams.toByteArray(file);
		}
		
	}
	
}

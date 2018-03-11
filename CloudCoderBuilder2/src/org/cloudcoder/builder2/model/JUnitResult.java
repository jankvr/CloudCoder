package org.cloudcoder.builder2.model;

import java.util.List;

public class JUnitResult {
	private final List<String> errors;
	private final boolean result;
	private final double codeCoverage;
	
	public JUnitResult(List<String> errors, boolean result, double codeCoverage) {
		this.errors = errors;
		this.result = result;
		this.codeCoverage = codeCoverage;
	}
	
	public List<String> getErrors() {
		return errors;
	}
	
	public boolean getResult() {
		return result;
	}
	
	public double getCodeCoveragePercentage() {
		return codeCoverage;
	}
}

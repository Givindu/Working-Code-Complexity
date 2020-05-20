package utils;

public class IndividualFunction {
	private int start;
	private int end;
	private String methodName;
	
	
	
	public IndividualFunction(int start, int end, String methodName) {
		super();
		this.start = start;
		this.end = end;
		this.methodName = methodName;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
}

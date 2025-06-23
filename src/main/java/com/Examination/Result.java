package com.Examination;

public class Result {
	private int resultID;
	private String grade;
	private String resultStatus;
	private int scheduleID;
	private int totalMarks;
	
	public Result(int resultID, String grade, String resultStatus, int scheduleID, int totalMarks) {

		this.resultID = resultID;
		this.grade = grade;
		this.resultStatus = resultStatus;
		this.scheduleID = scheduleID;
		this.totalMarks = totalMarks;
	}

	public int getResultID() {
		return resultID;
	}

	public String getGrade() {
		return grade;
	}

	public String getResultStatus() {
		return resultStatus;
	}

	public int getScheduleID() {
		return scheduleID;
	}

	public int getTotalMarks() {
		return totalMarks;
	}
	
}

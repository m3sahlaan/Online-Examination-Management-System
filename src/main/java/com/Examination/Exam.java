package com.Examination;

public class Exam {
	
	private int examID;
	private String examName;
	private int lecID;
	private int totMarks;
	private String course;
	private int duration;
	private String status;
	public Exam(int examID, String examName, int lecID, int totMarks, String course, int duration, String status) {
		this.examID = examID;
		this.examName = examName;
		this.lecID = lecID;
		this.totMarks = totMarks;
		this.course = course;
		this.duration = duration;
		this.status = status;
	}
	public int getExamID() {
		return examID;
	}
	public String getExamName() {
		return examName;
	}
	public int getLecID() {
		return lecID;
	}
	public int getTotMarks() {
		return totMarks;
	}
	public String getCourse() {
		return course;
	}
	public int getDuration() {
		return duration;
	}
	public String getStatus() {
		return status;
	}
	
	
}

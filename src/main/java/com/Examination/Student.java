package com.Examination;

public class Student {
		private int StdID;
	    private String fName;
	    private String lName;
	    private String DOB;
	    private String address;
	    private String course;
	    private String year;
	    private String pass;
		public Student(int stdID, String fName, String lName, String dOB, String address, String course, String year, String pass) {
			StdID = stdID;
			this.fName = fName;
			this.lName = lName;
			DOB = dOB;
			this.address = address;
			this.course = course;
			this.year = year;
			this.pass = pass;
		}
		public int getStdID() {
			return StdID;
		}
		public String getfName() {
			return fName;
		}
		public String getlName() {
			return lName;
		}
		public String getDOB() {
			return DOB;
		}
		public String getAddress() {
			return address;
		}
		public String getCourse() {
			return course;
		}
		public String getYear() {
			return year;
		}
		public String getPass() {
			return pass;
		}
	    
		
	    
		
}

package com.Examination;

public class Lecture {
	 	private int lecID;
	    private String fName;
	    private String lName;
	    private String Special;
	    private String Dept;
	    private String pass;
		public Lecture(int lecID, String fName, String lName, String special, String dept, String pass) {
			this.lecID = lecID;
			this.fName = fName;
			this.lName = lName;
			Special = special;
			Dept = dept;
			this.pass = pass;
		}
		public int getLecID() {
			return lecID;
		}
		public String getfName() {
			return fName;
		}
		public String getlName() {
			return lName;
		}
		public String getSpecial() {
			return Special;
		}
		public String getDept() {
			return Dept;
		}
		
		public String getPass() {
			return pass;
		}
	    
}

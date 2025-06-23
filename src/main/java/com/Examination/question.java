package com.Examination;

public class question {
		private int questionID;
		private int examID;
		private String questionText;
		private int Marks;
		private String questionType;
		public question(int questionID, int examID, String questionText, int marks, String questionType) {
			this.questionID = questionID;
			this.examID = examID;
			this.questionText = questionText;
			Marks = marks;
			this.questionType = questionType;
		}
		public int getQuestionID() {
			return questionID;
		}
		public int getExamID() {
			return examID;
		}
		public String getQuestionText() {
			return questionText;
		}
		public int getMarks() {
			return Marks;
		}
		public String getQuestionType() {
			return questionType;
		}
}

package com.Examination;

public class Feedback {
    private int feedbackID;
    private int examID;
    private int studentID;
    private String feedbackTEXT;
    private String rating;

    public Feedback(int feedbackID, int examID, int studentID, String feedbackTEXT, String rating) {
        this.feedbackID = feedbackID;
        this.examID = examID;
        this.studentID = studentID;
        this.feedbackTEXT = feedbackTEXT;
        this.rating = rating;
    }

    // Getters and Setters
    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getFeedbackTEXT() {
        return feedbackTEXT;
    }

    public void setFeedbackTEXT(String feedbackTEXT) {
        this.feedbackTEXT = feedbackTEXT;
    }

    public String getRating() {
        return rating;
    }

   
}

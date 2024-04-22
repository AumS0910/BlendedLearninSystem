package com.ailearner.app.AILearner.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class QuizAnalysis {
    @Id
    private Long studentPRN; // Student's PRN (assuming it's a unique identifier)
    private String studentName; // Student's name
    private String quizName; // Name of the quiz
    private int correctAnswers; // Number of correct answers
    private long totalTime; // Total time taken for the quiz (in milliseconds)

    public QuizAnalysis(String studentPRN, String studentName, String quizName, int correctAnswers, long totalTime) {
        this.studentPRN = Long.valueOf(studentPRN);
        this.studentName = studentName;
        this.quizName = quizName;
        this.correctAnswers = correctAnswers;
        this.totalTime = totalTime;
    }

    public Long getStudentPRN() {
        return studentPRN;
    }

    public void setStudentPRN(String studentPRN) {
        this.studentPRN = Long.valueOf(studentPRN);
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public int getCorrectAnswers() {
        return correctAnswers;
    }

    public void setCorrectAnswers(int correctAnswers) {
        this.correctAnswers = correctAnswers;
    }

    public long getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(long totalTime) {
        this.totalTime = totalTime;
    }

    @Override
    public String toString() {
        return "QuizAnalysis{" +
                "studentPRN='" + studentPRN + '\'' +
                ", studentName='" + studentName + '\'' +
                ", quizName='" + quizName + '\'' +
                ", correctAnswers=" + correctAnswers +
                ", totalTime=" + totalTime +
                '}';
    }
}

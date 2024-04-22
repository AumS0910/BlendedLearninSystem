package com.ailearner.app.AILearner.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document
public class Question {
    @Id
    private Long id;

    private String content;
    private List<Option> options;

    private Quiz quiz;

    private Answer correctAnswer;

    public Question(Long id, String content, List<Option> options, Quiz quiz, Answer correctAnswer) {
        this.id = id;
        this.content = content;
        this.options = options;
        this.quiz = quiz;
        this.correctAnswer = correctAnswer;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public Answer getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(Answer correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", options=" + options +
                ", quiz=" + quiz +
                ", correctAnswer=" + correctAnswer +
                '}';
    }
}

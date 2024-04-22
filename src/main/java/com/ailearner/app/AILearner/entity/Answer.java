package com.ailearner.app.AILearner.entity;

public class Answer {
    private Question question;
    private String content;

    public Answer(Question question, String content) {
        this.question = question;
        this.content = content;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "question=" + question +
                ", content='" + content + '\'' +
                '}';
    }
}



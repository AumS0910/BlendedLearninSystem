package com.ailearner.app.AILearner.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document
public class Quiz {
    @Id
    private Long id;
    private String content;

    private List<Question> questions;

    public Quiz(Long id, String content, List<Question> questions) {
        this.id = id;
        this.content = content;
        this.questions = questions;
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

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", questions=" + questions +
                '}';
    }
}

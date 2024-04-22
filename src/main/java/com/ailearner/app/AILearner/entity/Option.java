package com.ailearner.app.AILearner.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Option {
    @Id
    private int id;
    private String content;

    public Option(String content, int id) {
        this.content = content;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Option{" +
                "id=" + id +
                ", content='" + content + '\'' +
                '}';
    }
}

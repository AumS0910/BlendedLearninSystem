package com.ailearner.app.AILearner.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Option {
    @Id
    private int id;
    private String content;
}

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
}

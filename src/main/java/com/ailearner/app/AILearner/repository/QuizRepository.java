package com.ailearner.app.AILearner.repository;

import com.ailearner.app.AILearner.entity.Quiz;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface QuizRepository extends MongoRepository<Quiz,String> {
}

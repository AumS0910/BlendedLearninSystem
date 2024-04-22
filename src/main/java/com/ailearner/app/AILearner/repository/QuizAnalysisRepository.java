package com.ailearner.app.AILearner.repository;

import com.ailearner.app.AILearner.entity.QuizAnalysis;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface QuizAnalysisRepository extends MongoRepository<QuizAnalysis,Long> {
}

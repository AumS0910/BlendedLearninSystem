package com.ailearner.app.AILearner.service;

import com.ailearner.app.AILearner.entity.Quiz;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuizService {
    Quiz createQuiz(Quiz quiz);

    List<Quiz> getAllQuizzes();

    Quiz getQuizById(String quizId);
}

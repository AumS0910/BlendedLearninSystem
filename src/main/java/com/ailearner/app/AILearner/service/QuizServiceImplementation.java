package com.ailearner.app.AILearner.service;

import com.ailearner.app.AILearner.entity.Quiz;
import com.ailearner.app.AILearner.repository.CourseRepository;
import com.ailearner.app.AILearner.repository.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizServiceImplementation implements QuizService{

    @Autowired
    private QuizRepository quizRepository;

    @Override
    public Quiz createQuiz(Quiz quiz) {
        return quizRepository.save(quiz);
    }

    @Override
    public List<Quiz> getAllQuizzes() {
        return quizRepository.findAll();
    }

    @Override
    public Quiz getQuizById(String quizId) {
        return quizRepository.findById(quizId).orElse(null);
    }
}

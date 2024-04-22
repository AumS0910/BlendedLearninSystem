package com.ailearner.app.AILearner.service;

import com.ailearner.app.AILearner.entity.QuizAnalysis;
import com.ailearner.app.AILearner.repository.QuizAnalysisRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class QuizAnalysisServiceImpl implements QuizAnalysisService{

    @Autowired
    private QuizAnalysisRepository quizAnalysisRepository;
    @Override
    public QuizAnalysis analyzeQuiz(QuizAnalysis quizAnalysis) {
        return quizAnalysisRepository.save(quizAnalysis);
    }

    @Override
    public QuizAnalysis getQuizAnalysesByStudentPRN(Long PRN) {
        return quizAnalysisRepository.findById(PRN).get();
    }

}

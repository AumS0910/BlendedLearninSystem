package com.ailearner.app.AILearner.service;

import com.ailearner.app.AILearner.entity.QuizAnalysis;

public interface QuizAnalysisService {
    QuizAnalysis analyzeQuiz(QuizAnalysis quizAnalysis);

    QuizAnalysis getQuizAnalysesByStudentPRN(Long PRN);

}

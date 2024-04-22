package com.ailearner.app.AILearner.controllers;

import com.ailearner.app.AILearner.entity.QuizAnalysis;
import com.ailearner.app.AILearner.service.QuizAnalysisService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/quiz-analyses")
public class QuizAnalysisController {

    @Autowired
    private QuizAnalysisService quizAnalysisService;

    @PostMapping
    public ResponseEntity<QuizAnalysis> analyzeQuiz(@RequestBody QuizAnalysis quizAnalysis) {
        QuizAnalysis analyzedQuiz = quizAnalysisService.analyzeQuiz(quizAnalysis);
        return new ResponseEntity<>(analyzedQuiz, HttpStatus.CREATED);
    }

    @GetMapping("/user/{userId}")
    public QuizAnalysis getQuizAnalysesByStudentPRN(@PathVariable Long PRN) {
        return quizAnalysisService.getQuizAnalysesByStudentPRN(PRN);

    }
}

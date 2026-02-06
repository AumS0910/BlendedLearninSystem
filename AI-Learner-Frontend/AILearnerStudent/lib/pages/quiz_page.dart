import 'dart:convert';
import 'dart:developer';
import 'package:ailearner/pages/attempt_quiz_page.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/app_bar.dart';

class Quiz {
  String? id;
  String? content;
  List<Questions>? questions;

  Quiz({this.id, this.content, this.questions});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      content: json['content'],
      questions: List<Questions>.from(
          json['questions'].map((x) => Questions.fromJson(x))),
    );
  }
}

class Questions {
  String? id;
  String? content;
  List<Options>? options;
  String? quiz;
  CorrectAnswer? correctAnswer;

  Questions(
      {this.id, this.content, this.options, this.quiz, this.correctAnswer});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'],
      content: json['content'],
      options:
          List<Options>.from(json['options'].map((x) => Options.fromJson(x))),
      quiz: json['quiz'],
      correctAnswer: CorrectAnswer.fromJson(json['correctAnswer']),
    );
  }
}

class Options {
  String? id;
  String? content;

  Options({this.id, this.content});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      id: json['id'],
      content: json['content'],
    );
  }
}

class CorrectAnswer {
  String? question;
  String? content;

  CorrectAnswer({this.question, this.content});

  factory CorrectAnswer.fromJson(Map<String, dynamic> json) {
    return CorrectAnswer(
      question: json['question'],
      content: json['content'],
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Quiz> quizzes = [];

  @override
  void initState() {
    super.initState();
    fetchQuizzes();
  }

  Future<void> fetchQuizzes() async {
    final response =
        await http.get(Uri.parse('https://al-learner-backend.onrender.com/quizzes'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        quizzes = responseData.map((json) => Quiz.fromJson(json)).toList();
      });
      // Logging the fetched quizzes
      for (var quiz in quizzes) {
        log('Quiz ID: ${quiz.id}');
        log('Quiz Content: ${quiz.content}');
        for (var question in quiz.questions!) {
          log('Question ID: ${question.id}');
          log('Question Content: ${question.content}');
          log('Options:');
          for (var option in question.options!) {
            log('- ${option.content}');
          }
          log('Correct Answer: ${question.correctAnswer!.content}');
        }
      }
    } else {
      log("some error :-( ");
      throw Exception('Failed to load quizzes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Quizes"),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttemptQuizPage(
                    quizzes: quizzes,
                    id: quizzes[index].id!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: lightGreyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListTile(
                title: Text(quizzes[index].content ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}

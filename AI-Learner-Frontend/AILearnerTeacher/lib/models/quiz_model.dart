import 'package:ai_learner_teacher/models/question_model.dart';

class Quiz {
  final int id;
  final String content;
  final List<Question> questions;

  Quiz({required this.id, required this.content, required this.questions});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      content: json['content'],
      questions: (json['questions'] as List).map((question) => Question.fromJson(question)).toList(),
    );
  }
}
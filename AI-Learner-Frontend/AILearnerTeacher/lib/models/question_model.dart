import 'package:ai_learner_teacher/models/answer_model.dart';
import 'package:ai_learner_teacher/models/option_model.dart';

class Question {
  final int id;
  final String content;
  final List<Option> options;
  final Answer correctAnswer;

  Question({required this.id, required this.content, required this.options, required this.correctAnswer});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'options': options.map((option) => option.toJson()).toList(),
      'correctAnswer': correctAnswer.toJson(),
    };
  }
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      content: json['content'], id: 1, options: [], correctAnswer: Answer(content: ""),
    );
  }
}
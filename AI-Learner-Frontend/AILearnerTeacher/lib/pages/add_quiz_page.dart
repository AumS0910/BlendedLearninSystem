// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:ai_learner_teacher/components/app_bar.dart';
import 'package:ai_learner_teacher/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/text_field_component.dart';
import '../models/answer_model.dart';
import '../models/option_model.dart';
import '../models/question_model.dart';
import '../models/quiz_model.dart';
import '../utils/app_colors.dart';

class AddQuizPage extends StatefulWidget {
  const AddQuizPage({super.key});

  @override
  State<AddQuizPage> createState() => _AddQuizPageState();
}

class _AddQuizPageState extends State<AddQuizPage> {
  // final Quiz quiz = Quiz(
  //   id: 1,
  //   content: "OOP Question",
  //   questions: [
  //     Question(
  //       id: 1,
  //       content: "What is the syntax for declaring a variable in C++?",
  //       options: [
  //         Option(id: 1, content: "int x;"),
  //         Option(id: 2, content: "String x;"),
  //         Option(id: 3, content: "var x;"),
  //       ],
  //       correctAnswer: Answer(content: "int x;"),
  //     ),
  //     Question(
  //       id: 2,
  //       content: "What is a constructor in C++?",
  //       options: [
  //         Option(id: 4, content: "A method that initializes an object."),
  //         Option(id: 5, content: "A variable that holds an object."),
  //         Option(id: 6, content: "A class that extends another class."),
  //       ],
  //       correctAnswer: Answer(content: "A method that initializes an object."),
  //     ),
  //     Question(
  //       id: 3,
  //       content: "Explain the difference between == and .equals() in C++.",
  //       options: [
  //         Option(
  //             id: 7,
  //             content:
  //                 "== compares object references, .equals() compares object values."),
  //         Option(
  //             id: 8,
  //             content:
  //                 "== compares primitive values, .equals() compares object references."),
  //         Option(
  //             id: 9,
  //             content:
  //                 "== compares object values, .equals() compares object references."),
  //       ],
  //       correctAnswer: Answer(
  //           content:
  //               "== compares object references, .equals() compares object values."),
  //     ),
  //   ],
  // );

  Future<void> createQuiz(Quiz quiz) async {
    const url =
        'https://al-learner-backend.onrender.com/quizzes'; // Replace with your actual endpoint URL
    
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(quiz.toJson());

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 201) {
        showToast(context, "Quiz created successfully");
        Navigator.of(context).pop();
        log('Quiz created successfully');
      } else {
        showToast(context, "Failed to create quiz: ${response.statusCode}");
        log('Failed to create quiz: ${response.statusCode}');
      }
    } catch (error) {
      log('Error creating quiz: $error');
    }
  }

  List<Question> questions = [];

  void addQuestionToList() {
    var option1 = Option(id: 1, content: _optionOneController.text.toString());
    var option2 = Option(id: 1, content: _optionTwoController.text.toString());
    var option3 =
        Option(id: 1, content: _optionThreeController.text.toString());
    var option4 = Option(id: 1, content: _optionFourController.text.toString());
    var ans = Answer(content: _correctOptionController.text);
    var question = Question(
        id: 1,
        content: _questionController.text.toString(),
        options: [option1, option2, option3, option4],
        correctAnswer: ans);
    questions.add(question);
    setState(() {
      _questionController.clear();
      _optionOneController.clear();
      _optionTwoController.clear();
      _optionThreeController.clear();
      _optionFourController.clear();
      _correctOptionController.clear();
    });
  }

  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _optionOneController = TextEditingController();
  final TextEditingController _optionTwoController = TextEditingController();
  final TextEditingController _optionThreeController = TextEditingController();
  final TextEditingController _optionFourController = TextEditingController();
  final TextEditingController _correctOptionController =
      TextEditingController();
  final TextEditingController _quizNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Add a Quiz"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              Text(
                "Question Added ${questions.length}/15",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Quiz Name",
                textEditingController: _quizNameController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Question",
                textEditingController: _questionController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Option 1",
                textEditingController: _optionOneController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Option 2",
                textEditingController: _optionTwoController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Option 3",
                textEditingController: _optionThreeController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Option 4",
                textEditingController: _optionFourController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Correct Option",
                textEditingController: _correctOptionController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (questions.length < 15) {
                    addQuestionToList();
                  } else {
                    var quiz = Quiz(
                        id: 1,
                        content: _quizNameController.text.toString(),
                        questions: questions);
                    createQuiz(quiz);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  foregroundColor: Colors.black,
                  backgroundColor: lightPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: const Size(double.infinity, 50.0),
                ),
                child: (questions.length < 15)
                    ? const Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

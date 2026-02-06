// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:ailearner/components/app_bar.dart';
import 'package:ailearner/pages/quiz_page.dart';
import 'package:ailearner/pages/quiz_result_page.dart';
import 'package:ailearner/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttemptQuizPage extends StatefulWidget {
  AttemptQuizPage({super.key, required this.quizzes, required this.id});

  List<Quiz> quizzes;
  String id;

  @override
  State<AttemptQuizPage> createState() => _AttemptQuizPageState();
}

class _AttemptQuizPageState extends State<AttemptQuizPage> {
  DateTime? _pageStartTime;
  Duration? _timeSpent;

  @override
  void dispose() {
    _calculateTimeSpent();
    super.dispose();
  }

  void _calculateTimeSpent() {
    DateTime pageEndTime = DateTime.now();
    _timeSpent = pageEndTime.difference(_pageStartTime!);
    print("Time spent on page: ${_timeSpent!.inSeconds} seconds");
  }

  String? _selectedOption;

  late Quiz myQuiz;
  int count = 0;
  int quizSize = 0;

  @override
  void initState() {
    super.initState();
    _pageStartTime = DateTime.now();
    for (var item in widget.quizzes) {
      if (item.id == widget.id) {
        myQuiz = item;
        log("myQuiz ${myQuiz.questions!.length}");
      }
    }
    quizSize = myQuiz.questions!.length;
    setQuestion();
  }

  String question = "";
  String option1 = "";
  String option2 = "";
  String option3 = "";
  String option4 = "";
  int correctAns = 0;

  void setQuestion() {
    if (count >= quizSize) {
      _calculateTimeSpent();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return QuizResultPage(
            count: correctAns,
            duration: _timeSpent!,
          );
        }),
      );
      showToast(context, "quiz finish");
      return;
    }

    setState(() {
      question = myQuiz.questions![count].content!;
      option1 = myQuiz.questions![count].options![0].content!;
      option2 = myQuiz.questions![count].options![1].content!;
      option3 = myQuiz.questions![count].options![2].content!;
      option4 = myQuiz.questions![count].options![3].content!;
    });
  }

  void _handleOptionChange(String? value) {
    if (value != null) {
      setState(() {
        _selectedOption = value;
      });
      log("Selected option: $_selectedOption");
    }
  }

  @override
  Widget build(BuildContext context) {
    log("count: $count");
    log("Correct no: $correctAns");
    log("total: $quizSize");
    return Scaffold(
      appBar: appBar(context, "Quiz"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  // Grey background color for the question
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color:
                            Colors.black87, // Dark text color for readability
                        fontSize: 25,
                        fontFamily: 'Times New Roman',
                      ),
                ),
              ),
            ),
            ...[option1, option2, option3, option4].map((option) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                // Add padding around each option
                child: RadioListTile<String>(
                  title: Text(
                    option,
                    style: const TextStyle(
                      fontFamily:
                          'Times New Roman', // Set font family to Times New Roman
                    ),
                  ),
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                  activeColor: Colors.purple,

                  tileColor: Colors.grey[200],
                  // Apply a border with a shadow-like effect
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedOption != null) {
                    if (count > quizSize) {
                    } else if (_selectedOption ==
                        myQuiz.questions![count].correctAnswer!.content) {
                      correctAns++;
                      count++;
                      setQuestion();
                    } else {
                      count++;
                      setQuestion();
                    }
                  } else {
                    showToast(context, "Please select option");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(
                      0xFFAEB8FE), // Set the button color to #AEB8FE
                ),
                child: (count < quizSize)
                    ? const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20, // Adjust the font size here
                        ),
                      )
                    : const Text(
                        'Sumbit',
                        style: TextStyle(
                          fontSize: 20, // Adjust the font size here
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:ailearner/components/app_bar.dart';
import 'package:ailearner/models/course_model.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:ailearner/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoubtPage extends StatefulWidget {
  const DoubtPage({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  // ignore: library_private_types_in_public_api
  _DoubtPageState createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  late CourseModel _course;

  @override
  void initState() {
    super.initState();
    _course = widget.courseModel;
  }

  final TextEditingController _doubtController = TextEditingController();
  String _answer = '';

  Future<void> doubtSolvingAI() async {
    log("Theory: ${_course.theory}");
    if (_doubtController.text.toString().isEmpty) {
      showToast(context, "Enter a Question");
      return;
    }

    var request = http.MultipartRequest('POST',
        Uri.parse('https://swavalambanam-api.onrender.com/question_and_answer_chatbot/'));

    request.fields['context'] = _course.theory.toString();
    request.fields['question'] = _doubtController.text.toString();

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if(response.body.isNotEmpty) {
      var jsonResponse = json.decode(response.body);
      log("------------------------------------------------------------------");
      log(jsonResponse.toString());
      var answer = jsonResponse['answer'];
      log("Answer: $answer");
    }
    else {
      throw Exception("Data Not Received ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Topic Name"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Container for user's doubt
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: _doubtController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your doubt',
                          border: InputBorder.none,
                        ),
                        minLines: 1,
                        maxLines: 5,
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Button to solve doubt
                    ElevatedButton(
                      onPressed: () async {
                        await doubtSolvingAI();
                        setState(() {
                          // Simulating solving logic
                          _answer =
                              'This is the answer to your doubt: "${_doubtController.text} "';
                        });
                      },
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(const Size(50, 50)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(lightPurpleColor),
                      ),
                      child: const Text(
                        'Solve',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    SizedBox(
                      height: _answer.isNotEmpty ? null : 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey, // Set background color to grey
                          border: Border.all(color: lightGreyColor, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20.0,
                        ),
                        child: Text(
                          _answer,
                          style: const TextStyle(fontSize: 26.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _doubtController.dispose();
    super.dispose();
  }
}

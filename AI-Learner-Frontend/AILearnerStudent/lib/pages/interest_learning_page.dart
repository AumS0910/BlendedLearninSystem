import 'dart:developer';

import 'package:ailearner/components/app_bar.dart';
import 'package:ailearner/components/text_field_component.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:ailearner/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';



class InterestBasedLearningPage extends StatefulWidget {
  const InterestBasedLearningPage({super.key});

  @override
  State<InterestBasedLearningPage> createState() =>
      _InterestBasedLearningPageState();
}

class _InterestBasedLearningPageState extends State<InterestBasedLearningPage> {
  final TextEditingController intrestController = TextEditingController();
  final TextEditingController topicController = TextEditingController();

  bool isLoading = false;
  String data = "";
  String plainString = "";

  // FlutterTts flutterTts = FlutterTts();

  // Future<void> speak(String text) async {
  //   await flutterTts.setLanguage('en-US'); // Set the language (optional)
  //   await flutterTts.setPitch(1.0); // Set the pitch (1.0 is the default)
  //   await flutterTts.speak(text); // Speak the text
  // }

  void askPrompt(String prompt) async {
    final gemini = Gemini.instance;

    await gemini.text(prompt).then((value) {
      data = value!.output.toString();

      log(data);
      setState(() {
        data;
      });
      plainString = removeMarkdownSyntax(data);
      log(plainString);
      // ignore: invalid_return_type_for_catch_error
    }).catchError((e) => data = e.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Interest Based Learning"),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextFieldComponent(
                text: "Enter your Interest",
                textEditingController: intrestController,
              ),
              const SizedBox(height: 20),
              AppTextFieldComponent(
                text: "Enter the topic you want to Learn",
                textEditingController: topicController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (intrestController.text.toString().isEmpty &&
                      topicController.text.toString().isEmpty) {
                    showSnackBar(context, "Please enter your topic & intrest");
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    askPrompt(
                        "Hello Gemini you are a ${topicController.text.toString()} expert and have a deep knowledge of the topic and my interest is ${intrestController.text.toString()} please please help me to Learn the topic accordingly to my interest");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: lightPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: const Size(double.infinity, 50.0),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Learn',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     if (intrestController.text.toString().isEmpty &&
              //         topicController.text.toString().isEmpty) {
              //       showSnackBar(context, "Please enter your topic & intrest");
              //     }
              //   },
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.black,
              //     backgroundColor: lightPurpleColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     minimumSize: const Size(double.infinity, 50.0),
              //   ),
              //   child: const Text(
              //     'Listen',
              //     style: TextStyle(
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              (intrestController.text.toString().isEmpty &&
                      topicController.text.toString().isEmpty)? Container() :Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: lightGreyColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: MarkdownBody(
                  data: data,
                  styleSheet: MarkdownStyleSheet(
                    // ignore: deprecated_member_use
                    textScaleFactor: 1.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String removeMarkdownSyntax(String markdownText) {
    // Remove Markdown headings
    markdownText = markdownText.replaceAll(RegExp(r'^#+\s'), '');

    // Remove Markdown bold and italic
    markdownText = markdownText.replaceAll(RegExp(r'\*\*|\*'), '');

    // Remove Markdown lists
    markdownText = markdownText.replaceAll(RegExp(r'^- '), '');

    // Remove extra line breaks
    markdownText = markdownText.replaceAll(RegExp(r'\n+'), '\n');

    return markdownText.trim();
  }
}

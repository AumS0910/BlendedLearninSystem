// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:ailearner/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

import '../utils/images_name.dart';

// ignore: must_be_immutable
class QuizResultPage extends StatefulWidget {
  QuizResultPage({super.key, required this.count, required this.duration});

  int count;
  Duration duration;

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  String predictedRate = "";

  void getAnalysic() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://miniproject-zqrz.onrender.com/predict'));

    request.fields['Correct_Attempts'] = widget.count.toString();
    request.fields['Total_Time_Quiz'] = widget.duration.inMinutes.toString();

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.body.isNotEmpty) {
      final responseData = json.decode(response.body);
      log("data: $responseData");
      log("data: ${responseData['predicted_rate']}");
      // setState(() {
      //   predictedRate = responseData['predicted_rate'];
      // });
      log('successfully');
    } else {
      // Failed to add course
      log('Failed ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    log("Duration: ${widget.duration.inMinutes}");
    return Scaffold(
      appBar: appBar(context, "Quiz Result"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: 300,
                height: 300,
                child: Lottie.asset(robotLearningPath)),
            const Text(
              'Quiz Result',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your score is: ${widget.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Quiz Time Taken: ${widget.duration.inMinutes}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       getAnalysic();
            //     },
            //     style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.black,
            //       backgroundColor: lightPurpleColor,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       minimumSize: const Size(double.infinity, 50.0),
            //     ),
            //     child: const Text(
            //       'Analysis your Quiz',
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // Text(
            //   predictedRate,
            //   style: const TextStyle(fontSize: 30),
            // )
          ],
        ),
      ),
    );
  }
}

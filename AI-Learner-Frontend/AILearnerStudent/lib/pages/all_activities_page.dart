import 'dart:convert';

import 'package:ailearner/components/app_bar.dart';
import 'package:ailearner/pages/learning_activity_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/course_model.dart';
import '../utils/app_colors.dart';

class AllActivityPage extends StatefulWidget {
  const AllActivityPage({super.key});

  @override
  State<AllActivityPage> createState() => _AllActivityPageState();
}

class _AllActivityPageState extends State<AllActivityPage> {
  List<CourseModel> courseList = [];

  Future<void> getDataFromAPI() async {
    final response = await http
        .get(Uri.parse('https://al-learner-backend.onrender.com/course'));
    if (response.statusCode == 200) {
      // log("data received ${response.body} ");

      String jsonString = response.body.toString();

      courseList = (jsonDecode(jsonString) as List)
          .map((data) => CourseModel.fromJson(data))
          .toList();
    } else {
      throw Exception("Data Not Received ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "All Topics"),
      body: FutureBuilder(
        future: getDataFromAPI(),
        initialData: const CircularProgressIndicator(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: courseList.length,
            itemBuilder: (context, index) {
              return cardItem(
                courseList[index].aim,
                courseList[index].coverImagePath,
                courseList[index],
              );
            },
          );
        },
      ),
    );
  }

  Widget cardItem(String name, String imagePath, CourseModel courseModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LearningActivityPage(
                course: courseModel,
              );
            },
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                color: lightGreyColor,
              ),
              child: imagePath.isNotEmpty
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                "Aim: $name",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

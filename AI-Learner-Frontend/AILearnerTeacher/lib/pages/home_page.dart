import 'dart:convert';

import 'package:ai_learner_teacher/components/app_drawer.dart';
import 'package:ai_learner_teacher/models/course_model.dart';
import 'package:ai_learner_teacher/pages/add_activity_page.dart';
import 'package:ai_learner_teacher/pages/add_quiz_page.dart';
import 'package:ai_learner_teacher/pages/learning_activity_page.dart';
import 'package:ai_learner_teacher/pages/profile_page.dart';
import 'package:ai_learner_teacher/pages/quiz_details_page.dart';
import 'package:ai_learner_teacher/services/AuthServices.dart';
import 'package:ai_learner_teacher/utils/app_colors.dart';
import 'package:ai_learner_teacher/utils/images_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username = "Sam Altman";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final AuthService _authService = AuthService();

  Future<void> getUserName() async {
    username = await _authService.getName() as String;
  }

  List<CourseModel> courseList = [];

  Future<void> getCourseDataFromAPI() async {
    final response = await http
        .get(Uri.parse('https://al-learner-backend.onrender.com/course'));
    if (response.statusCode == 200) {
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
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          topContainer(),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            alignment: Alignment.topLeft,
            child: const Text(
              "Your Activities",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          FutureBuilder(
              future: getCourseDataFromAPI(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: 300,
                        child: Lottie.asset(
                            "assets/images/loading_animation.json"),
                      ),
                    ),
                  );
                } else if (snap.hasError) {
                  // Handle any errors that occurred during the fetch
                  return Center(
                    child: Text('Error: ${snap.error}'),
                  );
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => LearningActivityPage(
                                course: courseList[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          width: double.infinity,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 90,
                                child: Image.network(
                                  courseList[index].coverImagePath,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      courseList[index].title,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      courseList[index].aim,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          // child: ListTile(
                          //   leading: Image.network(
                          //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiBY2Q2YOuLbf_bN9mVv4heTTT0jSzQBU6kg&usqp=CAU",
                          //   ),
                          //   title: Text(
                          //     "Hello $index",
                          //     style: const TextStyle(
                          //       fontSize: 22,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                        ),
                      );
                    },
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const AddLearningActivityPage(),
                  ),
                );
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
              child: const Text(
                'Add Learning Activity',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const QuizDetails(),
                  ),
                );
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
              child: const Text(
                'Quiz',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 38, left: 20, right: 20),
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: const BoxDecoration(
        color: lightPurpleColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Image.asset(
                  menuIcon,
                  height: 35,
                  width: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const ProfileBody(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(personIcon),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            "Welcome Back👋🏻",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          FutureBuilder(
            future: getUserName(),
            builder: (context, snapshot) {
              return Text(
                username!,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

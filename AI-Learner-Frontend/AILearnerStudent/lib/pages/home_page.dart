import 'dart:convert';

import 'package:ailearner/components/app_drawer.dart';
import 'package:ailearner/pages/all_activities_page.dart';
import 'package:ailearner/pages/interest_learning_page.dart';
import 'package:ailearner/pages/learning_activity_page.dart';
import 'package:ailearner/pages/profile_page.dart';
import 'package:ailearner/services/auth_services.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:ailearner/utils/images_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../models/course_model.dart';

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

  Future<void> getDataFromAPI() async {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            topContainer(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: FutureBuilder(
                  future: getDataFromAPI(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Lottie.asset(
                            "assets/images/loading_animation.json"),
                      );
                    } else if (snap.hasError) {
                      // Handle any errors that occurred during the fetch
                      return Center(
                        child: Text('Error: ${snap.error}'),
                      );
                    }
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Continue Learning",
                              style: TextStyle(fontSize: 30),
                            ),
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.arrowtriangle_right_circle,
                                size: 40,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        const AllActivityPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        // FutureBuilder(
                        //   future: getDataFromAPI(),
                        //   builder: (context, snapshot) {
                        //     return ListView.builder(
                        //       itemCount: courseList.length,
                        //       itemBuilder: (context, index) {
                        //         return cardItem(courseList[index].title, courseList[index].coverImagePath);
                        //       },
                        //     );
                        //   },
                        // )
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              cardItem(
                                courseList[0].aim,
                                courseList[0].coverImagePath,
                                courseList[0],
                              ),
                              cardItem(
                                courseList[1].aim,
                                courseList[1].coverImagePath,
                                courseList[1],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "See All Topics",
                              style: TextStyle(fontSize: 30),
                            ),
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.arrowtriangle_right_circle,
                                size: 40,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        const AllActivityPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              cardItem(
                                courseList[2].aim,
                                courseList[2].coverImagePath,
                                courseList[2],
                              ),
                              cardItem(
                                courseList[3].aim,
                                courseList[3].coverImagePath,
                                courseList[3],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration:
            const BoxDecoration(color: lightGreyColor, shape: BoxShape.circle),
        margin: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const InterestBasedLearningPage(),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(chatFloatingActionButton),
            )),
      ),
    );
  }

  Widget cardItem(String name, String imagePath, CourseModel course) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => LearningActivityPage(
              course: course,
            ),
          ),
        );
      },
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.6,
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
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 38, left: 20, right: 20),
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.28,
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
              )
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

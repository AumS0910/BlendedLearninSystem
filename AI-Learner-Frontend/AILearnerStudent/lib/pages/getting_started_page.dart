

import 'package:ailearner/pages/login_page.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:ailearner/utils/images_name.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Lottie.asset(robotLearningPath),
            const Spacer(),
            TextButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightPurpleColor, elevation: 10),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text(
                "Lets Boost Learning with AI",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Delay navigation to the next page by 20 seconds
  //   Future.delayed(const Duration(seconds: 5), () {
  //     // Navigate to the next page
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) =>
  //             const HomePage(), // Replace 'NextPage' with the name of your next page
  //       ),
  //     );
  //   });
  // }
}

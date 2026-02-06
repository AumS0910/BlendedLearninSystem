
import 'package:ailearner/webpages/web_home_page.dart';
import 'package:ailearner/webpages/web_login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WebAuthGate extends StatelessWidget {
  const WebAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const WebHomePage();
          } else {
            return const WebLoginPage();
          }
        },
      ),
    );
  }
}
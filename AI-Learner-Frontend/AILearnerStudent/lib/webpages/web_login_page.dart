import 'package:ailearner/utils/images_name.dart';
import 'package:ailearner/utils/snack_bar.dart';
import 'package:ailearner/webpages/web_home_page.dart';
import 'package:ailearner/webpages/web_registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../services/auth_services.dart';
import '../utils/app_colors.dart';

class WebLoginPage extends StatefulWidget {
  const WebLoginPage({super.key});

  @override
  State<WebLoginPage> createState() => _WebLoginPageState();
}

class _WebLoginPageState extends State<WebLoginPage> {
  bool _isObscure = true;

  bool isLoading = false;

  final AuthService _authService = AuthService();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginUser() async {
    if (_mailController.text.toString().isEmpty) {
      showToast(context, "Please Enter Mail");
    } else if (_passwordController.text.toString().isEmpty) {
      showToast(context, "Please Enter Password");
    } else {
      String result = await _authService.signInWithEmailAndPassword(
          _mailController.text.toString(), _passwordController.text.toString());

      if (result == "success") {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const WebHomePage(),
          ),
        );
      } else {
        showToast(context, "some thing went wrong $result ");
        setState(() {
          isLoading = false;
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurpleColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: lightPurpleColor,
              ),
              child: Center(
                child: Lottie.asset(loginAnimation),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(35),
                  topEnd: Radius.circular(35),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.black, // Text color adjusted for contrast
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      controller: _mailController,
                      decoration: InputDecoration(
                        hintText: 'Mail',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //   builder: (context) => const HomePage(),
                        // ));
                        setState(() {
                          isLoading = true;
                        });
                        loginUser();
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
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don\'t have an Account?',
                        style: TextStyle(color: Colors.grey, fontSize: 19),
                      ),
                      const SizedBox(width: 1.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const WebRegisterPage()),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blue, fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ailearner/pages/home_page.dart';
import 'package:ailearner/pages/register_page.dart';
import 'package:ailearner/services/auth_services.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:ailearner/utils/images_name.dart';
import 'package:ailearner/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            builder: (context) => const HomePage(),
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
              height: MediaQuery.of(context).size.height * 0.3,
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
                  TextField(
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
                  const SizedBox(height: 20.0),
                  TextField(
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
                  const SizedBox(height: 20.0),
                  ElevatedButton(
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
                                builder: (context) => const RegisterScreen()),
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

/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is the main layout widget
      backgroundColor: Colors.white, // Set background color to white
      body: Stack(
        // Use Stack for layering widgets
        children: [
          // Purple background covering half the screen
          Positioned(
            left: 0.0,
            top: 0.0,
            right: 0.0,
            bottom: MediaQuery.of(context).size.height * 0.5,
            child: Opacity(
              opacity: 0.8, // Adjust opacity for transparency
              child: Container(
                color: lightPurpleColor,
                child: Container(
                  child: Lottie.asset(loginAnimation),
                ),
              ),
            ),
          ),
          // White container
          Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              decoration: BoxDecoration(
                color: Colors.white, // Set container background color to white
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: SingleChildScrollView(
                // Allow scrolling if content overflows
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
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Mail/PRN',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
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
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: lightPurpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(double.infinity, 50.0),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
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
                                  builder: (context) => const RegisterScreen()),
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
            ),
          ),
        ],
      ),
    );
    */
}

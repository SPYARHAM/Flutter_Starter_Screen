import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/common/ThemeHelper.dart';
import './profilePage.dart';

import '../Header_Widget.dart';
import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _heightHeader = 300;

  @override
  Widget build(BuildContext context) {
    Key formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _heightHeader,
              child: HeaderWidget(_heightHeader, true,
                  Icons.login_rounded), //create a common header Widget
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(
                    20, 10, 20, 10), // this will be the login form
                child: Column(
                  children: [
                    const Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Sign In into Your Account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextField(
                            decoration: ThemeHelper().textInputDecoration(
                              "User Name ",
                              "Enter Your Name Here ",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                              "Password ",
                              "Enter Your Password Here ",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            child: const Text("Forgot Password?"),
                          ),
                          Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Sign In".toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage(),
                                      ));
                                  //after successfull login we will redirect to login page
                                },
                              )),

                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            //child: const Text("Don't have an acoount? Create"),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: ("Don't have an acoount? "),
                                  ),
                                  TextSpan(
                                      text: (" Create "),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrationPage(),
                                            ),
                                          );
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).hintColor)),
                                ],
                              ),
                            ),
                          ), // now let's style the form and for this we will create the theme helper class
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:amy/constants.dart';
import 'package:amy/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:amy/authentication_service.dart';
import 'package:amy/constants.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/signup.dart';
import 'package:amy/routes/user/donation_page.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../validator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // builder: (context) => const SignupScreen(),
          builder: (context) => UHomeScreen(user: user),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: lightGreen,
        appBar: AppBar(
          backgroundColor: pineGreen,
          title: TitleMonterrsat("Home"),
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Image.asset(
                        'assets/amy_logo.png',
                        height: 280.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: HeaderMontserrat(
                        'Home',
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: StyledButtonMonterrsat(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            text: 'Log In',
                          ),
                        ),
                        SizedBox(width: 24.0),
                        Expanded(
                          child: StyledButtonMonterrsat(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            text: 'Sign Up',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

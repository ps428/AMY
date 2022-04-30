import 'package:amy/authentication_service.dart';
import 'package:amy/constants.dart';
import 'package:amy/routes/admin/ahome.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/signup.dart';
import 'package:amy/routes/user/donation_page.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool isEmailVerified = true;
  bool _attempetd = false;
  bool _wrongCredentials = false;
  late User default_user;
  late User adminUser;

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // builder: (context) => const SignupScreen(),
            builder: (context) => UHomeScreen(user: user),
          ),
        );
      } else {
        isEmailVerified = false;
      }
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
            title: const TitleMonterrsat("Login"),
          ),
          body: ListView(children: <Widget>[
            FutureBuilder(
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 24.0),
                          child: HeaderMontserrat(
                            'Log In',
                          ),
                        ),
                        // StyledButtonMonterrsat(
                        //     text: "Admin Login",
                        //     onPressed: () async => {
                        //           adminUser =
                        //               (await FireAuth.signInUsingEmailPassword(
                        //             email: 'ps205@snu.edu.in',
                        //             password: '123456',
                        //           ))!,
                        //           if (adminUser != null)
                        //             {
                        //               Navigator.of(context).pushReplacement(
                        //                 MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       AHomeScreen(user: adminUser),
                        //                   // builder: (context) =>
                        //                   //     const SignupScreen(),
                        //                 ),
                        //               )
                        //             }
                        //         }),
                        // StyledButtonMonterrsat(
                        //     text: "Default login",
                        //     onPressed: () async => {
                        //           default_user =
                        //               (await FireAuth.signInUsingEmailPassword(
                        //             email: 'ps205@snu.edu.in',
                        //             password: '123456',
                        //           ))!,
                        //           if (default_user != null)
                        //             {
                        //               Navigator.of(context).pushReplacement(
                        //                 MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       // HomeScreen()
                        //                       UHomeScreen(user: default_user),
                        //                   // builder: (context) =>
                        //                   //     const SignupScreen(),
                        //                 ),
                        //               )
                        //             }
                        //         }),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _emailTextController,
                                focusNode: _focusEmail,
                                validator: (value) => Validator.validateEmail(
                                  email: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              TextFormField(
                                controller: _passwordTextController,
                                focusNode: _focusPassword,
                                obscureText: true,
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              isEmailVerified
                                  ? const ParagraphMontserrat(
                                      "Please enter your credentials.")
                                  : const ParagraphMontserrat(
                                      "Error! Mail not verified"),
                              _isProcessing
                                  ? const CircularProgressIndicator()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: StyledButtonMonterrsat(
                                            onPressed: () async {
                                              _focusEmail.unfocus();
                                              _focusPassword.unfocus();

                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  _isProcessing = true;
                                                  _attempetd = true;
                                                  isEmailVerified = true;
                                                });

                                                if (_emailTextController.text ==
                                                        "admin@snu.edu.in" &&
                                                    _passwordTextController
                                                            .text ==
                                                        "admin123") {
                                                  // print("admin getting");
                                                  User? adminUser = await FireAuth
                                                      .signInUsingEmailPassword(
                                                          email:
                                                              "ps205@snu.edu.in",
                                                          password: "123456");
                                                  if (adminUser != null) {
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              // HomeScreen()
                                                              AHomeScreen(
                                                                user: adminUser,
                                                              )
                                                          // builder: (context) =>
                                                          //     const SignupScreen(),
                                                          ),
                                                    );
                                                  } else {
                                                    setState(() {
                                                      _wrongCredentials = true;
                                                    });
                                                  }
                                                } else {
                                                  User? user = await FireAuth
                                                      .signInUsingEmailPassword(
                                                    email: _emailTextController
                                                        .text,
                                                    password:
                                                        _passwordTextController
                                                            .text,
                                                  );

                                                  setState(() {
                                                    _isProcessing = false;
                                                  });

                                                  if (user != null) {
                                                    if (!user.emailVerified) {
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              // HomeScreen()
                                                              UHomeScreen(
                                                                  user: user),
                                                          // builder: (context) =>
                                                          //     const SignupScreen(),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    setState(() {
                                                      _wrongCredentials = true;
                                                    });
                                                  }
                                                }
                                              }
                                            },
                                            text: 'Log In',
                                          ),
                                        ),
                                        const SizedBox(width: 24.0),
                                        Expanded(
                                          child: StyledButtonMonterrsat(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignupScreen(),
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
                        )
                      ],
                    ),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ])),
    );
  }
}

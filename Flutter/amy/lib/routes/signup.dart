import 'package:amy/routes/user/donation_page.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../authentication_service.dart';
import '../constants.dart';
import '../validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<SignupScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _messIDTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusMessID = FocusNode();
  final _focusPhoneNumber = FocusNode();

  bool _isSendingVerification = false;
  bool _isDuplicateID = false;
  bool _attemptedSignUp = false;

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: lightGreen,
        appBar: AppBar(
          backgroundColor: pineGreen,
          title: const Text(
            'Sign Up',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: lightGreen,
                fontFamily: 'Monterrsat',
                fontSize: 36),
          ),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset(
                            'assets/amy_logo.png',
                            height: 280.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        TextFormField(
                          controller: _nameTextController,
                          focusNode: _focusName,
                          validator: (value) => Validator.validateName(
                            name: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Name",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
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
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        //TODO from here make the variable changes and all
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _messIDTextController,
                          focusNode: _focusMessID,
                          validator: (value) => Validator.validateMessID(
                            messID: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Mess ID",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _phoneNumberTextController,
                          focusNode: _focusPhoneNumber,
                          validator: (value) => Validator.validatePhoneNumber(
                            phone: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        //TODO above this
                        SizedBox(height: 32.0),
                        _isDuplicateID
                            ? HeaderMontserrat(
                                "Error! This email id is already taken.")
                            : _attemptedSignUp
                                ? HeaderMontserrat("Please verify your id!")
                                : ParagraphMontserrat(
                                    "Please enter Your details."),
                        _isProcessing
                            ? CircularProgressIndicator()
                            : Row(
                                children: [
                                  Expanded(
                                    child: StyledButtonMonterrsat(
                                      onPressed: () async {
                                        if (_registerFormKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            _isProcessing = true;
                                            _isSendingVerification = true;
                                            _isDuplicateID = false;
                                          });
                                        }

                                        if (_registerFormKey.currentState!
                                            .validate()) {
                                          List l = await FireAuth
                                              .registerUsingEmailPassword(
                                            name: _nameTextController.text,
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                            isDuplicateID: _isDuplicateID,
                                          );
                                          User? user = await l[0];
                                          _isDuplicateID = l[1];

                                          setState(() {
                                            _isProcessing = false;
                                            _attemptedSignUp = true;
                                          });

                                          if (user != null) {
                                            await user.sendEmailVerification();
                                            setState(() {
                                              _isSendingVerification = false;
                                            });
                                            if (_isDuplicateID == false &&
                                                user.emailVerified) {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      // HomeScreen()
                                                      UHomeScreen(user: user),
                                                  // builder: (context) =>
                                                  //     const SignupScreen(),
                                                ),
                                              );
                                            } else {}
                                            setState(() {
                                              _isProcessing = false;
                                            });
                                          }
                                        }
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
            ),
          ),
        ]),
      ),
    );
  }
}

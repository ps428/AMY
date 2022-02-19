import 'package:amy/routes/user/donation_page.dart';
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
            'Log In',
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
                            hintText: "MESS ID",
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
                        _isProcessing
                            ? CircularProgressIndicator()
                            : Row(
                                children: [
                                  Expanded(
                                    child: StyledButtonMonterrsat(
                                      onPressed: () async {
                                        setState(() {
                                          _isProcessing = true;
                                        });

                                        if (_registerFormKey.currentState!
                                            .validate()) {
                                          User? user = await FireAuth
                                              .registerUsingEmailPassword(
                                            name: _nameTextController.text,
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                          );

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          if (user != null) {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(user: user),
                                              ),
                                              ModalRoute.withName('/uhome'),
                                            );
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

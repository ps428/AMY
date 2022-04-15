import 'package:amy/constants.dart';
import 'package:amy/routes/admin/abill.dart';
import 'package:amy/routes/admin/ahome.dart';
import 'package:amy/routes/admin/ainventory.dart';
import 'package:amy/routes/admin/aserve.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/login.dart';
import 'package:amy/routes/signup.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:amy/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authentication_service.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  _AllScreen createState() => _AllScreen();
}

class _AllScreen extends State<AllScreen> {
  var _currentUser;
  late User adminUser;

  Future<void> getDataFromFirebase() async {
    var user = await FireAuth.signInUsingEmailPassword(
        email: 'ps205@snu.edu.in', password: '123456');
    setState(() {
      _currentUser = user;
    });
  }

  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: pineGreen,
        title: const Text(
          'All page access screens',
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: lightGreen,
              fontFamily: 'Caveat',
              fontSize: 40),
        ),
        // backgroundColor: pista,
      ),
      body: ListView(children: <Widget>[
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pushNamed(context, '/');
          },
          child: const Text(
            'Go to main!',
            style: TextStyle(fontFamily: 'Caveat', color: apricotWhite),
          ),
          // style: ElevatedButton.styleFrom(primary: japanBlush),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: const Text('Go to Home!'),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: const Text('Go to Login'),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            FireAuth.signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
                // builder: (context) =>
                //     const SignupScreen(),
              ),
            );
          },
          child: const Text('Log out'),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              ),
            );
          },
          child: const Text('Go to Signup!'),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AHomeScreen(
                  user: _currentUser,
                ),
              ),
            );
          },
          child: const Text('Go to Admin Home!'),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AServeScreen(user: _currentUser),
              ),
            );
          },
          child: const Text('Go to Admin serve!'),
        ),
        ElevatedButton(
          // Within the AllScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AInventoryScreen(
                  user: _currentUser,
                ),
              ),
            );
          },
          child: const Text('Go to Admin Inventory!'),
        ),
        const HeaderMontserrat('Montersat heading'),
        StyledButtonMonterrsat(
            text: "Admin Login",
            onPressed: () async => {
                  adminUser = (await FireAuth.signInUsingEmailPassword(
                    email: 'ps205@snu.edu.in',
                    password: '123456',
                  ))!,
                  if (adminUser != null)
                    {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AHomeScreen(user: adminUser),
                          // builder: (context) =>
                          //     const SignupScreen(),
                        ),
                      )
                    }
                }),
        StyledButtonMonterrsat(
            text: "Test Screen",
            onPressed: () => {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const TestScreen(),
                      // builder: (context) =>
                      //     const SignupScreen(),
                    ),
                  )
                }),
        const ParagraphMontserrat(
            'A demo paraghaph!A demo  paraghaph!A demo paraghaph!A demo paraghaph!'),
        const ParagraphMontserrat(
            'A demo paraghaph!A demo  paraghaph!A demo paraghaph!A demo paraghaph!'),
        const ParagraphMontserrat(
            'A demo paraghaph!A demo  paraghaph!A demo paraghaph!A demo paraghaph!'),
        const ParagraphMontserrat(
            'A demo paraghaph!A demo  paraghaph!A demo paraghaph!A demo paraghaph!'),
      ]),
    );
  }
}

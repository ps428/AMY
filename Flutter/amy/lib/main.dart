import 'dart:js';

import 'package:amy/all.dart';
import 'package:amy/routes/admin/ahome.dart';
import 'package:amy/routes/admin/aordered.dart';
import 'package:amy/routes/admin/aserve.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/login.dart';
import 'package:amy/routes/signup.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AMY: A Meal by Me',
      // Start the app with the "/" named route. In this case, the app starts
      // on the LoadingScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the LoadingScreen widget.
        '/': (context) => const LoadingScreen(),
        '/all': (context) => const AllScreen(),

        //Public routes
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),

        //Admin routes
        '/ahome': (context) => const AHomeScreen(),
        '/aserve': (context) => const AServeScreen(),
        '/aordered': (context) => const AOrderedScreen(),

        //User routes
        '/uhome': (context) => const UHomeScreen(),
        '/udonate': (context) => const UDonateScreen(),
        '/uthanks': (context) => const UThanksScreen(),
      },
    ),
  );
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AMY'),
        ),
        body: SafeArea(
            child: Center(
              child: Column(children: [
                ElevatedButton(
              // Within the `LoadingScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Loading Screen'),
            ),
            ElevatedButton(
              // Within the `LoadingScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/all');
              },
              child: const Text('All Screen'),
            ),
          ]),
        )));
  }
}

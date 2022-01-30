import 'package:amy/constants.dart';
import 'package:flutter/material.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGreen,
        appBar: AppBar(
          backgroundColor: greenAmy,
          title: const Text(
            'All page access screens',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: bar,
                fontFamily: 'Caveat',
                fontSize: 40),
          ),
          // backgroundColor: pista,
        ),
        body: Center(
          child: Column(children: [
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
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Go to Home!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Go to Login'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Go to Signup!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/ahome');
              },
              child: const Text('Go to Admin Home!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/aordered');
              },
              child: const Text('Go to Admin Ordered!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/aserve');
              },
              child: const Text('Go to Admin serve!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/udonate');
              },
              child: const Text('Go to User Donate!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/uhome');
              },
              child: const Text('Go to User Home!'),
            ),
            ElevatedButton(
              // Within the AllScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/uthanks');
              },
              child: const Text('Go to User Thanks!'),
            ),
          ]),
        ));
  }
}

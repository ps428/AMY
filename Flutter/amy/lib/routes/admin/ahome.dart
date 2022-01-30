import 'package:amy/constants.dart';
import 'package:flutter/material.dart';

class AHomeScreen extends StatelessWidget {
  const AHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: japanBlush,
      appBar: AppBar(
        title: const Text('AHome Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the AHomeScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pushNamed(context, '/');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

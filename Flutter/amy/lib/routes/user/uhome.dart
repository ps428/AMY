import 'package:flutter/material.dart';

class UHomeScreen extends StatelessWidget {
  const UHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UHome Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the UHomeScreen widget
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

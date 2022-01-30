import 'package:amy/constants.dart';
import 'package:flutter/material.dart';

class AServeScreen extends StatelessWidget {
  const AServeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apricotWhite,
      appBar: AppBar(
        title: const Text('AServe Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the AServeScreen widget
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

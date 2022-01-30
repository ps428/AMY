import 'package:amy/constants.dart';
import 'package:flutter/material.dart';

class UThanksScreen extends StatelessWidget {
  const UThanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pistaliter,
      appBar: AppBar(
        title: const Text('UThanks Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the UThanksScreen widget
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

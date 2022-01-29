import 'package:flutter/material.dart';

class AOrderedScreen extends StatelessWidget {
  const AOrderedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AOrdered Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the AOrderedScreen widget
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

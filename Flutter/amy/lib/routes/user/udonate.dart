import 'package:flutter/material.dart';

class UDonateScreen extends StatelessWidget {
  const UDonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UDonate Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the UDonateScreen widget
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

import 'package:flutter/material.dart';

import '../../constants.dart';

class UDonateScreen extends StatefulWidget {
  const UDonateScreen({Key? key}) : super(key: key);

  @override
  _UDonateScreen createState() => _UDonateScreen();
}

class _UDonateScreen extends State<UDonateScreen> {
  get bottomAppBarContents => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UDonate Screen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              // Within the UDonateScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Go back!'),
            ),
            StyledButtonMonterrsat(
              // Within the UDonateScreen widget
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pushNamed(context, '/');
              },
              text: 'Donate!',
            ),
            Container(
              //  alignment: Alignment.bottomCenter,
              height: 50.0,
              width: double.infinity,
            ),
            Container(
                // //  alignment: Alignment.bottomCenter,
                height: 50.0,
                //    width: double.infinity,
                color: Color(0xffC0D8C0),
                child: Row(
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      // Within the UDonateScreen widget
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Home'),
                    ),
                    ElevatedButton(
                      // Within the UDonateScreen widget
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Test Button 2'),
                    ),
                    ElevatedButton(
                      // Within the UDonateScreen widget
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Test Button 3'),
                    ),
                  ],
                )),
          ],
        ) /* add child content here */,
      ),
    );
  }
}

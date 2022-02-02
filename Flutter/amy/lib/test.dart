import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class LoadingScreenasa extends StatelessWidget {
  const LoadingScreenasa({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        'AMY: A Meal by You',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        'assets/amy_logo.png',
                        height: 150.0,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 200.0),
                      child: SpinKitHourGlass(
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                    StyledButtonPlayfair(
                        text: 'To All',
                        onPressed: () => {Navigator.pushNamed(context, '/all')})
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:amy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: const [SpinKitCircle(color: apricotWhite, size: 50.0)],
        ) /* add child content here */,
      ),
    );
  }
}

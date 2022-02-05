import 'dart:async';
import 'dart:ui';
import 'package:amy/all.dart';
import 'package:amy/constants.dart';
import 'package:amy/routes/admin/ahome.dart';
import 'package:amy/routes/admin/aordered.dart';
import 'package:amy/routes/admin/aserve.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/login.dart';
import 'package:amy/routes/signup.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:amy/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AMY: A Meal by You',
      // Start the app with the "/" named route. In this case, the app starts
      // on the LoadingScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the LoadingScreen widget.
        '/': (context) => const LoadingScreen(),
        '/all': (context) => const AllScreen(),

        //Public routes
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),

        //Admin routes
        '/ahome': (context) => const AHomeScreen(),
        '/aserve': (context) => const AServeScreen(),
        '/aordered': (context) => const AOrderedScreen(),

        //User routes
        '/uhome': (context) => const UHomeScreen(),
        '/udonate': (context) => const UDonateScreen(),
        '/uthanks': (context) => const UThanksScreen(),
      },
    ),
  );
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Navigator.pushNamed(context, '/all');
    });
    super.initState();
  }

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
                        height: 180.0,
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

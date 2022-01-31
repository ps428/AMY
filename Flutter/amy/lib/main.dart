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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AMY: A Meal by Me',
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

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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

import 'dart:math';

import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/Amy/2.png',
  'assets/Amy/3.png',
  'assets/Amy/4.png',
  'assets/Amy/5.png'
];

class UThanksScreen extends StatefulWidget {
  final User user;

  const UThanksScreen({required this.user});

  @override
  _UThanksScreen createState() => _UThanksScreen();
}

class _UThanksScreen extends State<UThanksScreen> {
  late User _currentUser;
  late ConfettiController _topController;

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UHomeScreen(
            user: _currentUser,
          ),
        ),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UDonateScreen(
            user: _currentUser,
          ),
        ),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UAccountScreen(
            user: _currentUser,
          ),
        ),
      );
    }
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState() {
    _currentUser = widget.user;
    _topController = ConfettiController(duration: const Duration(seconds: 10));
    _topController.play();

    super.initState();
  }

  @override
  void dispose() {
    // dispose the controller
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const TitleMonterrsat("Thanks for Donation"),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset('assets/Amy/1.gif'),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              color: bgThanks,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Yay! You fed someone.",
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontFamily: 'Montserrat',
                                        color: fgThanks)),
                                const Text(
                                  "",
                                ),
                                Text("Thank you ${_currentUser.displayName}",
                                    style: const TextStyle(
                                        fontSize: 34,
                                        fontFamily: 'Montserrat',
                                        color: fgThanks)),
                                const Text("for donating",
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontFamily: 'Montserrat',
                                        color: fgThanks)),
                                const Text(
                                  "#AMealByYou",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 34,
                                      fontFamily: 'Montserrat',
                                      color: fgThanks),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

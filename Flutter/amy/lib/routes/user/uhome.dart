import 'package:amy/constants.dart';
import 'package:amy/routes/admin/abill.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebaseUserClass.dart';

class UHomeScreen extends StatefulWidget {
  final User user;

  const UHomeScreen({required this.user});

  @override
  _UHomeScreen createState() => _UHomeScreen();
}

class _UHomeScreen extends State<UHomeScreen> {
  late User _currentUser;

  int _selectedIndex = 0;
  bool countersUpdated = false;
  var counters;

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
    updateCounter();
    super.initState();
  }

  Future<void> updateCounter() async {
    var tmp = await FirebaseUserClass.getCounters();
    setState(() {
      counters = tmp;
      countersUpdated = true;
      print(counters[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Donate Food',
          style: TextStyle(color: lightGreen, fontFamily: 'OpenSans'),
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("Welcome to AMY"),
          ParagraphMontserrat(
            'NAME: ${_currentUser.displayName}',
          ),
          const Paragraph(
            'Some cool quote!',
          ),
          StyledButtonPlayfair(
              text: "Show confett page",
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UThanksScreen(
                          user: _currentUser,
                        ),
                      ),
                    )
                  }),
          countersUpdated
              ? ParagraphMontserrat("Total meals donated: " +
                  counters[0].toString() +
                  " Total meals served: " +
                  counters[1].toString())
              : ParagraphMontserrat("Loading data")
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

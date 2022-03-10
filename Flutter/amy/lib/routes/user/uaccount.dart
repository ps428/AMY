import 'package:amy/constants.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication_service.dart';
import 'firebaseUserClass.dart';

class UAccountScreen extends StatefulWidget {
  final User user;

  const UAccountScreen({required this.user});

  @override
  _UAccountScreen createState() => _UAccountScreen();
}

class _UAccountScreen extends State<UAccountScreen> {
  late User _currentUser;

  int _selectedIndex = 2;

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
    getDataFromFirebase();
    super.initState();
  }

  Future<void> getDataFromFirebase() async {
    // var counterTmp = await FirebaseUserClass.getCounters();
    // var messDataTmp =
    //     await FirebaseUserClass.getUserMessDeatils(widget.user.uid);

    var userData = await FirebaseUserClass.getUserRecords(widget.user.uid);
    setState(() {
      // counters = counterTmp;
      // messData = messDataTmp;
      // isFirebaseCalled = true;
      // // print(counters[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(color: lightGreen, fontFamily: 'OpenSans'),
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("Account Details"),
          Text(
            'Name: ${_currentUser.displayName}',
          ),
          const Paragraph(
            'Tables!',
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: StyledButtonMonterrsat(
                  text: "Sign Out",
                  onPressed: () => {
                        FireAuth.signOut(),
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                            // builder: (context) =>
                            //     const SignupScreen(),
                          ),
                        )
                      })),
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

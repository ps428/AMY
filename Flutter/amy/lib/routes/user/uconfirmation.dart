import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebaseUserClass.dart';

class UConfirmationScreen extends StatefulWidget {
  final User user;
  final List l;

  const UConfirmationScreen({required this.user, required this.l});

  @override
  _UConfirmationScreen createState() => _UConfirmationScreen();
}

class _UConfirmationScreen extends State<UConfirmationScreen> {
  late User _currentUser;
  late List l;

  int _selectedIndex = 0;

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
    l = widget.l;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Confirm Donation',
          style: TextStyle(color: lightGreen, fontFamily: 'OpenSans'),
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: mustard,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    HeaderMontserrat("Confirm Your Donation"),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          Column(
            children: [
              ParagraphMontserrat("Hey " + _currentUser.displayName.toString()),
              ParagraphMontserrat(
                  "Your Balance post donation is " + l[0].toString()),
              ParagraphMontserrat("Your Donation cost is " + l[1].toString()),
              ParagraphMontserrat(
                  "You are donating " + l[2].toString() + " breakfasts,"),
              ParagraphMontserrat(
                  "You are donating " + l[3].toString() + " lunches,"),
              ParagraphMontserrat(
                  "You are donating " + l[4].toString() + " dinners,"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledButtonMonterrsat(
                  text: "Confirm",
                  onPressed: () {
                    FirebaseUserClass.updateDonations(
                        _currentUser.uid.toString(), l);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UThanksScreen(
                          user: _currentUser,
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                width: 80,
              ),
              StyledButtonMonterrsat(
                  text: "Go back",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UDonateScreen(
                          user: _currentUser,
                        ),
                      ),
                    );
                  }),
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

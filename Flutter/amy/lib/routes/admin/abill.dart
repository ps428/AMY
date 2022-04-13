import 'package:amy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ahome.dart';
import 'ainventory.dart';
import 'aserve.dart';

class ABillScreen extends StatefulWidget {
  final User user;
  final Map<String, dynamic> details;
  const ABillScreen({required this.user, required this.details});

  @override
  _ABillScreen createState() => _ABillScreen();
}

class _ABillScreen extends State<ABillScreen> {
  int _selectedIndex = 0;
  late User _currentUser;
  late Map<String, dynamic> details;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AHomeScreen(user: _currentUser)),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AServeScreen(user: _currentUser)),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AInventoryScreen(user: _currentUser)),
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
    details = widget.details;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const TitleMonterrsat("Bill"),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const Header("Billing"),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          Text(details.toString()),
          StyledButtonMonterrsat(
              text: 'Serve Again',
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AServeScreen(user: _currentUser),
                      ),
                    )
                  }),
          StyledButtonMonterrsat(
              text: 'Show Records',
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AHomeScreen(user: _currentUser),
                      ),
                    )
                  }),
          StyledButtonMonterrsat(
              text: 'Show Inventory',
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            AInventoryScreen(user: _currentUser),
                      ),
                    )
                  }),
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
            label: 'Serve Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Show Inventory',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:amy/constants.dart';
import 'package:amy/routes/admin/abill.dart';
import 'package:amy/routes/admin/ainventory.dart';
import 'package:amy/routes/admin/aserve.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AHomeScreen extends StatefulWidget {
  const AHomeScreen({Key? key}) : super(key: key);

  @override
  _AHomeScreen createState() => _AHomeScreen();
}

class _AHomeScreen extends State<AHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AHomeScreen()),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AServeScreen()),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AInventoryScreen()),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Admin Home',
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
          const Header("Counter and all"),
          const Text(
            'Details: ',
          ),
          const Paragraph(
            'Tables!',
          ),
          StyledButtonPlayfair(
            text: "To bill screen",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ABillScreen(),
                ),
              );
            },
          ),
          StyledButtonMonterrsat(
              text: "Log Out",
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    )
                  })
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
            label: 'Show Records',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

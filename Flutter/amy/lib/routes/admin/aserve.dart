import 'package:amy/constants.dart';
import 'package:amy/routes/admin/firebaseAdminClass.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ahome.dart';
import 'ainventory.dart';

class AServeScreen extends StatefulWidget {
  final User user;
  const AServeScreen({required this.user});

  @override
  _AServeScreen createState() => _AServeScreen();
}

class _AServeScreen extends State<AServeScreen> {
  int _selectedIndex = 1;
  late User _currentUser;
  bool availability = true;
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
    super.initState();
  }

  void serveMeal(String meal) async {
    availability = await checkMealAvailability(meal);
    if (availability) FirebaseAdminClass.serveMeal(meal);
  }

  Future<bool> checkMealAvailability(String meal) async {
    List<int> inventoryData = await FirebaseAdminClass.getAdminInventory();

    if (meal == 'adminBreakfast') {
      if (inventoryData[0] == 0) return false;
    }
    if (meal == 'adminLunch') {
      if (inventoryData[1] == 0) return false;
    }
    if (meal == 'adminDinner') {
      if (inventoryData[2] == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const TitleMonterrsat(
          'Serve',
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const HeaderMontserrat("Serve Meal"),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              StyledButtonMonterrsat(
                  text: "Serve Breakfast",
                  onPressed: () => serveMeal('adminBreakfast')),
              const SizedBox(
                height: 20,
              ),
              StyledButtonMonterrsat(
                  text: "Serve Lunch",
                  onPressed: () => serveMeal('adminLunch')),
              const SizedBox(
                height: 20,
              ),
              StyledButtonMonterrsat(
                  text: "Serve Dinner",
                  onPressed: () => serveMeal('adminDinner')),
              availability
                  ? const Text("")
                  : const HeaderMontserratWarning('WARNING! OUT OF STOCKS'),
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

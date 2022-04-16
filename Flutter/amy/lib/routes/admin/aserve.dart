import 'package:amy/constants.dart';
import 'package:amy/routes/admin/firebaseAdminClass.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'abill.dart';
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

  Future<void> checkMeal(String meal, BuildContext context) async {
    availability = await checkMealAvailability(meal);
    if (availability) {
      showAlertDialog(context, meal);
    } else {
      showWarning(context);
    }
  }

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  void serveMeal(String meal) async {
    availability = await checkMealAvailability(meal);
    if (availability) {
      Map<String, dynamic> details = await FirebaseAdminClass.serveMeal(meal);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ABillScreen(user: _currentUser, details: details),
      ));
    } else {}
  }

  Future<bool> checkMealAvailability(String meal) async {
    List<int> inventoryData = await FirebaseAdminClass.getAdminInventory();
    // print(inventoryData);
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
          'Serve Meal',
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60.0,
                width: 200.0,
                decoration: const BoxDecoration(
                    color: bgExpand,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [HeaderMontserrat("Serve Meal")],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
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
              Image.asset(
                'assets/Food/breakfast.png',
                height: 130.0,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(
                height: 10,
              ),
              StyledButtonMonterrsatBig(
                  text: "Breakfast",
                  onPressed: () => {checkMeal('adminBreakfast', context)}),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/Food/lunch.png',
                height: 130.0,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(
                height: 10,
              ),
              StyledButtonMonterrsatBig(
                  text: "  Lunch  ",
                  onPressed: () => {checkMeal('adminLunch', context)}),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/Food/dinner.png',
                height: 130.0,
                fit: BoxFit.scaleDown,
              ),
              StyledButtonMonterrsatBig(
                  text: "  Dinner  ",
                  onPressed: () => {checkMeal('adminDinner', context)}),
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
            label: 'Show Inventory',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  showAlertDialog(BuildContext context, String meal) {
    // set up the buttons
    Widget cancelButton = StyledButtonMonterrsat(
        text: "Cancel",
        onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AServeScreen(user: _currentUser),
              ))
            });
    Widget continueButton = StyledButtonMonterrsat(
        text: "Confirm", onPressed: () => {serveMeal(meal)});

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const HeaderMontserrat("Confirm Serving"),
      content: const ParagraphMontserrat("Are you sure to serve this meal?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showWarning(BuildContext context) {
    // set up the buttons
    Widget cancelButton = StyledButtonMonterrsat(
        text: "OK",
        onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AServeScreen(user: _currentUser),
              ))
            });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const HeaderMontserrat("Error!"),
      content: const HeaderMontserratWarning("Inventory Underflow"),
      actions: [
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

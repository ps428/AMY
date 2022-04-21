import 'package:amy/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  int _selectedIndex = 1;
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
    preProcess();
    super.initState();
  }

  void preProcess() {
    // var today = DateTime.now();

    // var validTime = today.add(const Duration(minutes: 30)).toString();
    // Timestamp now = Timestamp.now();
    // print(now.seconds);

    var parsedDate = DateTime.parse(details['Serving Time']);
    var validTime = parsedDate.add(const Duration(minutes: 30)).toString();
    details['Current Time'] = validTime;

    // Timestamp now = Timestamp.fromDate(parsedDate);
    // details['Bill ID'] = now.seconds.toString();

    // print(details['Bill ID'] + " " + validTime + " " + details['Serving Time']);

    details['Meal'] = details['Meal Type'].split('admin')[1];
    // print(details['Meal Type'].split('admin'));
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
          const SizedBox(height: 70),
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 0.9,
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                  color: lavendar,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                child: Column(
                  children: [
                    const HeaderMontserrat("Meal Receipt"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParagraphMontserrat(
                                'Bill ID: ' + details['Bill ID']),
                            const SizedBox(
                              height: 20,
                            ),
                            ParagraphMontserrat(
                                'Time: ' + details['Serving Time']),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Image.asset(
                          'assets/amy_logo.png',
                          height: 80.0,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        ParagraphMontserrat('Meal Type: 1 ' + details['Meal']),
                        const SizedBox(
                          height: 15,
                        ),
                        const ParagraphMontserrat("Your Meal Super Star is"),
                        Text(
                          details['Name'],
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset(
                            'assets/qr.png',
                            height: 80.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ParagraphMontserrat(
                              "Valid upto 30 minutes till:\n " +
                                  details['Current Time']),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              StyledButtonMonterrsat(
                  text: 'Print',
                  onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                AServeScreen(user: _currentUser),
                          ),
                        )
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

import 'package:amy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen();

  @override
  _TestScreen createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  int _selectedIndex = 1;
  late User _currentUser;
  late Map<String, dynamic> details;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TestScreen()),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TestScreen()),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TestScreen()),
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
    // _currentUser = widget.user;
    // details = widget.details;
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
          const SizedBox(height: 70),
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 0.8,
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
                            const ParagraphMontserrat("bill id"),
                            SizedBox(
                              height: 20,
                            ),
                            const ParagraphMontserrat("date and time")
                          ],
                        ),
                      ),
                      new Spacer(),
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
                        ParagraphMontserrat("meal type"),
                        SizedBox(
                          height: 15,
                        ),
                        ParagraphMontserrat("your super star is"),
                        ParagraphPlayfair("Jayati"),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset(
                            'assets/amy_logo.png',
                            height: 80.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ParagraphMontserrat("valit upto")
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

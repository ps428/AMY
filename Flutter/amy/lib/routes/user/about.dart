import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  final User user;

  const AboutScreen({required this.user});

  @override
  _AboutScreen createState() => _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  late User _currentUser;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(color: lightGreen, fontFamily: 'OpenSans'),
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  'assets/amy_logo.png',
                  height: 180.0,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const ParagraphMontserrat(
            "AMY is an innovative food bank app designed by keeping SNU’s current mess ecosystem in consideration. AMY lends a helping hand to the students to make efficient use of their about to be lapsed mess card balance by making meal donations for the people for whom affording the meals is not that simple, eg. gardeners, nurserymen, guards working in night shifts etc.",
          ),
          const SizedBox(
            height: 12,
          ),
          const Align(
            alignment: Alignment.center,
            child: HeaderPlayfair("Minds behind Meals"),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,

                children: const [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(7),
                  //   // Image border
                  //   child: SizedBox.fromSize(
                  //     size: const Size.fromRadius(70), // Image radius
                  //     child: Image.asset("assets/Minds/jayati.png",
                  //         fit: BoxFit.contain),
                  //   ),
                  // ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 101.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/Minds/jayati.png'),
                      radius: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  // ClipOval(
                  //   child: SizedBox.fromSize(
                  //     size: const Size.fromRadius(50), // Image radius
                  //     child: Image.asset("assets/Minds/jayati.png"),
                  //   ),
                  // ),
                  HeaderPlayfair("Jayati")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: const [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(7), // Image border
                  //   child: SizedBox.fromSize(
                  //     size: const Size.fromRadius(70), // Image radius
                  //     child: Image.asset("assets/Minds/pranav.png",
                  //         fit: BoxFit.contain),
                  //   ),
                  // ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 101.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/Minds/pranav.png'),
                      radius: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HeaderPlayfair("Pranav")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: const [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(7), // Image border
                  //   child: SizedBox.fromSize(
                  //     size: const Size.fromRadius(70), // Image radius
                  //     child: Image.asset("assets/Minds/madhav.png",
                  //         fit: BoxFit.contain),
                  //   ),
                  // ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 101.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/Minds/madhav.png'),
                      radius: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HeaderPlayfair("Madhav")
                ],
              ),
            ],
          )
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

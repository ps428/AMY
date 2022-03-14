import 'package:amy/constants.dart';
import 'package:amy/routes/admin/abill.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebaseUserClass.dart';

final List<String> imgList = [
  'https://media.istockphoto.com/photos/poor-indian-children-asking-for-food-india-picture-id524903696?k=20&m=524903696&s=612x612&w=0&h=lyOsBJSuxpNFYhoFQDrkBjWrMulPnMkQHkhfQWw2Z4g=',
  'https://thumbs.dreamstime.com/b/double-exposure-hunger-begging-hands-dry-soil-represent-lot-people-world-hungry-starvation-need-69057865.jpg',
  'https://media.istockphoto.com/photos/african-girl-eating-a-meal-in-the-orphanage-picture-id108349181?k=20&m=108349181&s=612x612&w=0&h=fgoQ9CW_tHzInBPVLYOPVqZYfp0MQCrB3nBUUTAUetc=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYMw_KObr82gHU8mJiK5w6CyNkYeIDCAZRCg&usqp=CAU'
];

class UHomeScreen extends StatefulWidget {
  final User user;

  const UHomeScreen({required this.user});

  @override
  _UHomeScreen createState() => _UHomeScreen();
}

class _UHomeScreen extends State<UHomeScreen> {
  late User _currentUser;

  int _selectedIndex = 0;
  bool isFirebaseCalled = false;
  var counters;
  var messData;

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
    var counterTmp = await FirebaseUserClass.getCounters();
    var messDataTmp =
        await FirebaseUserClass.getUserMessDeatils(widget.user.uid);

    setState(() {
      counters = counterTmp;
      messData = messDataTmp;
      isFirebaseCalled = true;
      // print(counters[0]);
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
          const Align(
            alignment: Alignment.center,
            child: HeaderMontserrat("Welcome to AMY"),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          isFirebaseCalled
              //     ? ParagraphMontserrat("Total meals donated: " +
              //         counters[0].toString() +
              //         " Total meals served: " +
              //         counters[1].toString())
              //     : const ParagraphMontserrat("Loading counters"),
              // isFirebaseCalled
              //     ? ParagraphMontserrat("Hello " +
              //         messData[0] +
              //         "! Your mess id is: " +
              //         messData[1].toString() +
              //         " Your account balance is: INR " +
              //         messData[2].toString())
              ? Column(children: [
                  ParagraphMontserrat(
                    'Welcome ${_currentUser.displayName}!',
                  ),
                  ParagraphMontserrat(
                    'Your Mess ID is ${messData[1].toString()}',
                  ),
                  ParagraphMontserrat(
                    'Your current balance is \u{20B9}${messData[2].toString()}',
                  ),
                  const Divider(
                    height: 8,
                    thickness: 1,
                    indent: 8,
                    endIndent: 8,
                    color: Colors.grey,
                  ),
                  const ParagraphMontserrat(
                    'AMY Status: ',
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ProgressBar(
                              value: counters[0] / (counters[2] / 100),
                              size: counters[2] / (counters[2] / 100),
                              counts: counters[0],
                              total: counters[2],
                            ),
                            ParagraphMontserrat(counters[0].toString() +
                                " meals donated so far."),
                            ParagraphMontserrat("Target of " +
                                counters[2].toString() +
                                " meal donation."),
                          ],
                        ),
                        Column(
                          children: [
                            ProgressBar(
                              value: 1.0 * counters[1] / (counters[0] / 100),
                              size: 3.0 * counters[0] / (counters[0] / 100),
                              counts: counters[1],
                              total: counters[0],
                            ),
                            ParagraphMontserrat(counters[1].toString() +
                                " meals served so far."),
                            ParagraphMontserrat(counters[0].toString() +
                                " meal donated so far."),
                          ],
                        )
                      ],
                    ),
                  )
                ])
              : const ParagraphMontserrat("Loading user data"),
          // StyledButtonPlayfair(
          //     text: "Test donations",
          //     onPressed: () => {
          //           FirebaseUserClass.updateDonations(
          //               _currentUser.uid.toString(), [3100, 900, 1, 1, 1])
          //         }),
          StyledButtonPlayfair(
              text: "Confetti",
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UThanksScreen(
                          user: _currentUser,
                        ),
                      ),
                    )
                  }),
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
          CarouselSlider(
            options: CarouselOptions(),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
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

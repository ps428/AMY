import 'package:amy/constants.dart';
import 'package:amy/routes/user/about.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebaseUserClass.dart';

final List<String> imgList = [
  'assets/Amy/2.png',
  'assets/Amy/4.png',
  'assets/Amy/5.png',
  'assets/Amy/3.png'
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
        title: const TitleMonterrsat("AMY: A Meal by You"),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
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
                  const Align(
                    alignment: Alignment.center,
                    child: HeaderMontserrat("Welcome to AMY"),
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
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 140.0,
                                width: 300.0,
                                decoration: const BoxDecoration(
                                    color: mustard,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ParagraphMontserrat(
                                      'Hey ${_currentUser.displayName}!',
                                    ),
                                    ParagraphMontserrat(
                                      'Your Mess ID is ${messData[1].toString()}',
                                    ),
                                    ParagraphMontserrat(
                                      'Your balance is \u{20B9}${messData[2].toString()}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
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
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 290.0,
                                width: 300.0,
                                decoration: const BoxDecoration(
                                    color: lavendar,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const HeaderMontserrat("Donation Status"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              ProgressBar(
                                                value: counters[0] /
                                                    (counters[2] / 100),
                                                size: counters[2] /
                                                    (counters[2] / 100),
                                                counts: counters[0],
                                                total: counters[2],
                                              ),
                                              ParagraphMontserrat(
                                                  "Donated meals " +
                                                      counters[0].toString() +
                                                      "/" +
                                                      counters[2].toString()),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            children: [
                                              ProgressBar(
                                                value: 1.0 *
                                                    counters[1] /
                                                    (counters[0] / 100),
                                                size: 3.0 *
                                                    counters[0] /
                                                    (counters[0] / 100),
                                                counts: counters[1],
                                                total: counters[0],
                                              ),
                                              ParagraphMontserrat(
                                                  "Served meals " +
                                                      counters[1].toString() +
                                                      "/" +
                                                      counters[0].toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ])
                      : const ParagraphMontserrat("Loading user data"),
                  // StyledButtonPlayfair(
                  //     text: "Test donations",
                  //     onPressed: () => {
                  //           FirebaseUserClass.updateDonations(
                  //               _currentUser.uid.toString(), [3100, 900, 1, 1, 1])
                  //         }),
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
                    options: CarouselOptions(
                      //REMOVABLE
                      // height: 150,
                      aspectRatio: 20 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: imgList
                        .map((item) => Center(
                                child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                            )))
                        .toList(),
                  ),
                  // StyledButtonPlayfair(
                  //     text: "Confetti",
                  //     onPressed: () => {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) => UThanksScreen(
                  //                 user: _currentUser,
                  //               ),
                  //             ),
                  //           )
                  //         }),
                ],
              )),
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
      floatingActionButton: SizedBox(
        height: 40.0,
        width: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => AboutScreen(
                  user: _currentUser,
                ), // builder: (context) =>
                //     const SignupScreen(),
              ),
            ); // Add your onPressed code here!
          },
          backgroundColor: pineGreen,
          child: const Icon(Icons.info_outline_rounded),
        ),
      ),
    );
  }
}

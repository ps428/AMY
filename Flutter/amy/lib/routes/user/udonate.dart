import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/uconfirmation.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'firebaseUserClass.dart';

class UDonateScreen extends StatefulWidget {
  final User user;

  const UDonateScreen({required this.user});

  @override
  _UDonateScreen createState() => _UDonateScreen();
}

class _UDonateScreen extends State<UDonateScreen> {
  late User _currentUser;

  int _selectedIndex = 1;
  int donationOption = -1; //TODO for admin buttons

  final List l = [];

  final _lunchCounts = TextEditingController();
  final _dinnerCounts = TextEditingController();
  final _breakfastCounts = TextEditingController();

  final breakfastPrice = 40;
  final lunchPrice = 70;
  final dinnerPrice = 70;

  bool estimate = false;
  bool errorNegative = false;
  bool errorInteger = false;
  bool notEnoughFunds = false;

  int breakfastCounts = 0;
  int lunchCounts = 0;
  int dinnerCounts = 0;

  int cost = 0;
  var messData;

  Future<void> getDataFromFirebase() async {
    var messDataTmp =
        await FirebaseUserClass.getUserMessDeatils(widget.user.uid);
    setState(() {
      messData = messDataTmp;
    });
  }

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

  bool isNumeric(String s) {
    if (s == '') {
      return true;
    }
    return double.tryParse(s) != null;
  }

  @override
  void initState() {
    _currentUser = widget.user;
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightGreen,
        appBar: AppBar(
          title: const TitleMonterrsat("Donate Now"),
          backgroundColor: pineGreen,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            const SizedBox(
              height: 35,
            ),
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
              height: 25,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: mustard,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    HeaderPlayfair("Start by feeding someone..."),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 8,
              endIndent: 8,
              color: Colors.grey,
            ),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 20.0,
              child: TextField(
                  autofocus: true,
                  controller: _breakfastCounts,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Breakfast Donations',
                    hintText: "0",
                    isDense: true,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 20.0,
              child: TextField(
                  autofocus: true,
                  controller: _lunchCounts,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lunch Donations',
                    hintText: "0",
                    isDense: true,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 20.0,
              child: TextField(
                  autofocus: true,
                  controller: _dinnerCounts,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Dinner Donations',
                    hintText: "0",
                    isDense: true,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButtonMonterrsat(
                  text: "Get Estimate",
                  onPressed: () => {
                    if (!isNumeric(_breakfastCounts.text) ||
                        !isNumeric(_lunchCounts.text) ||
                        !isNumeric(_dinnerCounts.text))
                      {
                        setState(() {
                          errorInteger = true;
                          estimate = true;
                        }),
                      }
                    else
                      {
                        if (_breakfastCounts.text == '') breakfastCounts = 0,
                        if (_lunchCounts.text == '') lunchCounts = 0,
                        if (_dinnerCounts.text == '') dinnerCounts = 0,
                        if (_breakfastCounts.text != '')
                          breakfastCounts = int.parse(_breakfastCounts.text),
                        if (_lunchCounts.text != '')
                          lunchCounts = int.parse(_lunchCounts.text),
                        if (_dinnerCounts.text != '')
                          dinnerCounts = int.parse(_dinnerCounts.text),
                        setState(() {
                          cost = 0;
                          estimate = true;
                          errorNegative = false;
                        }),
                        if (breakfastCounts < 0 ||
                            lunchCounts < 0 ||
                            dinnerCounts < 0)
                          {
                            setState(() {
                              cost = 0;
                              estimate = true;
                              errorNegative = true;
                              errorInteger = false;
                            }),
                          }
                        else
                          {errorNegative = false},
                        if (!errorNegative)
                          setState(() {
                            cost = breakfastCounts * breakfastPrice +
                                lunchCounts * lunchPrice +
                                dinnerCounts * dinnerPrice;
                            estimate = true;
                            errorInteger = false;
                          }),
                        if (int.parse(messData[2].toString()) - cost < 0)
                          setState(() {
                            notEnoughFunds = true;
                          }),
                        if (int.parse(messData[2].toString()) - cost >= 0)
                          setState(() {
                            notEnoughFunds = false;
                          }),
                        if (errorNegative)
                          {
                            const SnackBar(
                              content: Text(
                                  'Error! Negative donations is invalid, can not proceed!'),
                            ),
                            setState(() {
                              cost = 0;
                              estimate = true;
                              errorNegative = true;
                            }),
                          }
                      },
                    // print(errorInteger)

                    // print("----------"),
                    // print(cost),
                    // print('b ' + breakfastCounts.toString()),
                    // print('l ' + lunchCounts.toString()),
                    // print('d ' + dinnerCounts.toString())
                  },
                ),
                const SizedBox(
                  width: 80,
                ),
                StyledButtonMonterrsat(
                    text: "Donate",
                    onPressed: () => {
                          //so test by branch not by node
                          if (!isNumeric(_breakfastCounts.text) ||
                              !isNumeric(_lunchCounts.text) ||
                              !isNumeric(_dinnerCounts.text))
                            {
                              setState(() {
                                errorInteger = true;
                                estimate = true;
                              }),
                            }
                          else
                            {
                              if (_breakfastCounts.text == '')
                                breakfastCounts = 0,
                              if (_breakfastCounts.text != '')
                                breakfastCounts =
                                    int.parse(_breakfastCounts.text),

                              if (_lunchCounts.text == '') lunchCounts = 0,
                              if (_lunchCounts.text != '')
                                lunchCounts = int.parse(_lunchCounts.text),

                              if (_dinnerCounts.text == '') dinnerCounts = 0,
                              if (_dinnerCounts.text != '')
                                dinnerCounts = int.parse(_dinnerCounts.text),

                              if (breakfastCounts < 0 ||
                                  lunchCounts < 0 ||
                                  dinnerCounts < 0)
                                {
                                  setState(() {
                                    cost = 0;
                                    estimate = true;
                                    errorInteger = false;
                                    errorNegative = true;
                                  }),
                                }
                              else
                                {errorNegative = false},

                              // print(estimate),
                              // print(errorNegative),
                              if (!errorNegative)
                                setState(() {
                                  cost = breakfastCounts * breakfastPrice +
                                      lunchCounts * lunchPrice +
                                      dinnerCounts * dinnerPrice;
                                  errorInteger = false;
                                  estimate = true;
                                }),

                              if (int.parse(messData[2].toString()) - cost < 0)
                                setState(() {
                                  notEnoughFunds = true;
                                }),
                              if (int.parse(messData[2].toString()) - cost >= 0)
                                setState(() {
                                  notEnoughFunds = false;
                                }),
                              if (notEnoughFunds)
                                {
                                  const SnackBar(
                                    content: Text(
                                        'Not enough funds, can not proceed!'),
                                  )
                                },
                              if (!notEnoughFunds && errorNegative == false)
                                {
                                  l.add(
                                      int.parse(messData[2].toString()) - cost),
                                  l.add(cost),
                                  l.add(breakfastCounts),
                                  l.add(lunchCounts),
                                  l.add(dinnerCounts),
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => UConfirmationScreen(
                                        user: _currentUser,
                                        l: l,
                                      ),
                                    ),
                                  )
                                },
                              if (errorNegative)
                                {
                                  const SnackBar(
                                    content: Text(
                                        'Error! Negative donations are invalid, can not proceed!'),
                                  ),
                                  setState(() {
                                    cost = 0;
                                    estimate = true;
                                    errorNegative = true;
                                  }),
                                },
                            },
                          // print(errorInteger)
                        })
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            estimate
                ? errorInteger
                    ? Column(children: const [
                        HeaderMontserratWarning("Enter valid integral values!")
                      ])
                    : errorNegative
                        ? Column(children: const [
                            HeaderMontserratWarning(
                                "Invalid negative donations"),
                          ])
                        : notEnoughFunds
                            ? Column(children: [
                                const Text(
                                  "OUT OF FUNDS!",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: red,
                                      fontSize: 40),
                                ),
                                ParagraphMontserrat(
                                    "Current Donation value is: " +
                                        cost.toString()),
                                const SizedBox(
                                  height: 20,
                                ),
                                ParagraphMontserrat(
                                    "Your balance post donation is: " +
                                        (int.parse(messData[2].toString()) -
                                                cost)
                                            .toString()),
                                const Icon(
                                  Icons.not_interested_rounded,
                                  color: red,
                                )
                              ])
                            : Column(
                                children: [
                                  ParagraphMontserrat(
                                      "Current Donation value is: \u{20B9}" +
                                          cost.toString()),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ParagraphMontserrat(
                                      "Your balance post donation is: \u{20B9}" +
                                          (int.parse(messData[2].toString()) -
                                                  cost)
                                              .toString()),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, //Center Row contents vertically,

                                    children: [
                                      breakfastCounts > 5
                                          ? const FoodImage(
                                              location:
                                                  "assets/Food/breakfast3.png",
                                            )
                                          : breakfastCounts > 2
                                              ? const FoodImage(
                                                  location:
                                                      "assets/Food/breakfast2.png",
                                                )
                                              : breakfastCounts > 0
                                                  ? const FoodImage(
                                                      location:
                                                          "assets/Food/breakfast.png",
                                                    )
                                                  : const Paragraph(""),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      lunchCounts > 5
                                          ? const FoodImage(
                                              location:
                                                  "assets/Food/lunch 3.png",
                                            )
                                          : lunchCounts > 2
                                              ? const FoodImage(
                                                  location:
                                                      "assets/Food/lunch 2.png",
                                                )
                                              : lunchCounts > 0
                                                  ? const FoodImage(
                                                      location:
                                                          "assets/Food/lunch.png",
                                                    )
                                                  : const Paragraph(""),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      dinnerCounts > 5
                                          ? const FoodImage(
                                              location:
                                                  "assets/Food/dinner 3.png",
                                            )
                                          : dinnerCounts > 2
                                              ? const FoodImage(
                                                  location:
                                                      "assets/Food/dinner 2.png",
                                                )
                                              : dinnerCounts > 0
                                                  ? const FoodImage(
                                                      location:
                                                          "assets/Food/dinner.png",
                                                    )
                                                  : const Paragraph(""),
                                    ],
                                  )
                                ],
                              )
                :
                // const ParagraphMontserrat(""),
                CarouselSlider(
                    options: CarouselOptions(
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
        ));
  }
}

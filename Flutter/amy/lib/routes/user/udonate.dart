import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/uconfirmation.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  final breakfastPrice = 50;
  final lunchPrice = 70;
  final dinnerPrice = 70;

  bool estimate = false;
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
        title: const HeaderMontserrat("Donate Now"),
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
          Align(
            alignment: Alignment.center,
            child: HeaderMontserrat(
              'Welcome ${_currentUser.displayName}!',
            ),
          ),
          // Column(
          //   children: [
          //     Row(
          //       children: [
          const ParagraphMontserrat("Donate Meals: "),
          const SizedBox(
            height: 10,
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
            height: 10,
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
            height: 10,
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
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
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
                          cost = breakfastCounts * breakfastPrice +
                              lunchCounts * lunchPrice +
                              dinnerCounts * dinnerPrice;
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
                        // print("----------"),
                        // print(cost),
                        // print('b ' + breakfastCounts.toString()),
                        // print('l ' + lunchCounts.toString()),
                        // print('d ' + dinnerCounts.toString())
                      }),
              const SizedBox(
                width: 80,
              ),
              StyledButtonMonterrsat(
                  text: "Donate This",
                  onPressed: () => {
                        if (_breakfastCounts.text != '')
                          breakfastCounts = int.parse(_breakfastCounts.text),
                        if (_lunchCounts.text != '')
                          lunchCounts = int.parse(_lunchCounts.text),
                        if (_dinnerCounts.text != '')
                          dinnerCounts = int.parse(_dinnerCounts.text),
                        setState(() {
                          cost = breakfastCounts * breakfastPrice +
                              lunchCounts * lunchPrice +
                              dinnerCounts * dinnerPrice;
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
                              content:
                                  Text('Not enough funds, can not proceed!'),
                            )
                          },
                        if (!notEnoughFunds)
                          {
                            l.add(int.parse(messData[2].toString()) - cost),
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
                          }
                      })
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          estimate
              ? notEnoughFunds
                  ? Column(children: [
                      const Text(
                        "OUT OF FUNDS!",
                        style: TextStyle(fontFamily: 'Montserrat', color: red),
                      ),
                      ParagraphMontserrat(
                          "Current Donation value is: " + cost.toString()),
                      ParagraphMontserrat("Your balance post donation is: " +
                          (int.parse(messData[2].toString()) - cost).toString())
                    ])
                  : Column(
                      children: [
                        ParagraphMontserrat(
                            "Current Donation value is: " + cost.toString()),
                        ParagraphMontserrat("Your balance post donation is: " +
                            (int.parse(messData[2].toString()) - cost)
                                .toString())
                      ],
                    )
              : const ParagraphMontserrat("Enter some input to get estimate"),

          //       ],
          //     ),
          //     Row(
          //       children: [
          //         TextField(
          //autofocus: true,
          //             controller: _lunchCounts,
          //             decoration: const InputDecoration(
          //               hintText: "0",
          //             )),
          //         const ParagraphMontserrat("Lunch")
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         TextField(
          // autofocus: true,
          //             controller: _dinnerCounts,
          //             decoration: const InputDecoration(
          //               hintText: "0",
          //             )),
          //         const ParagraphMontserrat("Dinner")
          //       ],
          //     ),
          //     const SizedBox(height: 8.0),
          //   ],
          // )
          // Column( TODO USE THE SAME FOR ADMIN DONATION OPTION
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     ListTile(
          //       title: const ParagraphMontserrat("Donate Breakfast"),
          //       leading: Radio(
          //         value: 1,
          //         groupValue: donationOption,
          //         onChanged: (value) {
          //           setState(() {
          //             donationOption = value as int;
          //           });
          //         },
          //         activeColor: Colors.green,
          //       ),
          //     ),
          //     ListTile(
          //       title: const ParagraphMontserrat("Donate Lunch"),
          //       leading: Radio(
          //         value: 2,
          //         groupValue: donationOption,
          //         onChanged: (value) {
          //           setState(() {
          //             donationOption = value as int;
          //           });
          //         },
          //         activeColor: Colors.green,
          //       ),
          //     ),
          //     ListTile(
          //       title: const ParagraphMontserrat("Donate Dinner"),
          //       leading: Radio(
          //         value: 3,
          //         groupValue: donationOption,
          //         onChanged: (value) {
          //           setState(() {
          //             donationOption = value as int;
          //           });
          //         },
          //         activeColor: Colors.green,
          //       ),
          //     ),
          //   ],
          // ),
          // StyledButtonMonterrsat(
          //     text: "Serve Meal",
          //     onPressed: () => {
          //           //todo
          //         }),
          // const Paragraph(
          //   'Tables!',
          // ),
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

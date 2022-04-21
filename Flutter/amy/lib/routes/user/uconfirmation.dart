import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:amy/routes/user/uthanks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebaseUserClass.dart';

class UConfirmationScreen extends StatefulWidget {
  final User user;
  final List l;

  const UConfirmationScreen({required this.user, required this.l});

  @override
  _UConfirmationScreen createState() => _UConfirmationScreen();
}

class _UConfirmationScreen extends State<UConfirmationScreen> {
  late User _currentUser;
  late List l;

  int _selectedIndex = 1;

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

  Widget createTable() {
    List<DataRow> dataRows = [];
    dataRows.add(
      DataRow(
        cells: <DataCell>[
          const DataCell(Center(child: Text("Breakfast"))),
          DataCell(Center(child: Text(l[2].toString()))),
          DataCell(Center(child: Text((l[2] * 40).toString()))),
        ],
      ),
    );
    dataRows.add(
      DataRow(
        cells: <DataCell>[
          const DataCell(Center(child: Text("Lunch"))),
          DataCell(Center(child: Text(l[3].toString()))),
          DataCell(Center(child: Text((l[3] * 70).toString()))),
        ],
      ),
    );
    dataRows.add(
      DataRow(
        cells: <DataCell>[
          const DataCell(Center(child: Text("Dinner"))),
          DataCell(Center(child: Text(l[4].toString()))),
          DataCell(Center(child: Text((l[4] * 70).toString()))),
        ],
      ),
    );
    dataRows.add(
      DataRow(
        color: MaterialStateProperty.all(lavendar),
        cells: <DataCell>[
          const DataCell(Center(
              child: Text(
            "Total",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))),
          DataCell(Center(
              child: Text(
            (l[2] + l[3] + l[4]).toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))),
          DataCell(Center(
              child: Text(
            (l[2] * 40 + l[3] * 70 + l[4] * 70).toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))),
        ],
      ),
    );

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Meal Name',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Quantity',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Cost',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
        ], rows: dataRows));
  }

  @override
  void initState() {
    _currentUser = widget.user;
    l = widget.l;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const TitleMonterrsat("Confirm Donation"),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(40.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                height: 25,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: mustard,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    HeaderMontserrat("Confirm Your Donation"),
                  ],
                ),
              ),
            ],
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
          const SizedBox(
            height: 25,
          ),

          // Column(
          //   children: [
          //     ParagraphMontserrat("Hey " + _currentUser.displayName.toString()),
          //     ParagraphMontserrat(
          //         "Your Balance post donation is " + l[0].toString()),
          //     ParagraphMontserrat("Your Donation cost is " + l[1].toString()),
          //     ParagraphMontserrat(
          //         "You are donating " + l[2].toString() + " breakfasts,"),
          //     ParagraphMontserrat(
          //         "You are donating " + l[3].toString() + " lunches,"),
          //     ParagraphMontserrat(
          //         "You are donating " + l[4].toString() + " dinners,"),
          //   ],
          // ),
          Align(
            alignment: Alignment.center,
            child: createTable(),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledButtonMonterrsat(
                  text: "Confirm",
                  onPressed: () {
                    FirebaseUserClass.updateDonations(
                        _currentUser.uid.toString(), l);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UThanksScreen(
                          user: _currentUser,
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                width: 80,
              ),
              StyledButtonMonterrsat(
                  text: "Go back",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UDonateScreen(
                          user: _currentUser,
                        ),
                      ),
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,

            children: [
              l[2] > 5
                  ? const FoodImage(
                      location: "assets/Food/breakfast3.png",
                    )
                  : l[2] > 2
                      ? const FoodImage(
                          location: "assets/Food/breakfast2.png",
                        )
                      : l[2] > 0
                          ? const FoodImage(
                              location: "assets/Food/breakfast.png",
                            )
                          : const Paragraph(""),
              const SizedBox(
                width: 15,
              ),
              l[3] > 5
                  ? const FoodImage(
                      location: "assets/Food/lunch 3.png",
                    )
                  : l[3] > 2
                      ? const FoodImage(
                          location: "assets/Food/lunch 2.png",
                        )
                      : l[3] > 0
                          ? const FoodImage(
                              location: "assets/Food/lunch.png",
                            )
                          : const Paragraph(""),
              const SizedBox(
                width: 15,
              ),
              l[4] > 5
                  ? const FoodImage(
                      location: "assets/Food/dinner 3.png",
                    )
                  : l[4] > 2
                      ? const FoodImage(
                          location: "assets/Food/dinner 2.png",
                        )
                      : l[4] > 0
                          ? const FoodImage(
                              location: "assets/Food/dinner.png",
                            )
                          : const Paragraph(""),
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

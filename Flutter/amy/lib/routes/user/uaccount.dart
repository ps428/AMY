import 'package:amy/constants.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../authentication_service.dart';
import 'about.dart';
import 'firebaseUserClass.dart';

class UAccountScreen extends StatefulWidget {
  final User user;
  const UAccountScreen({required this.user});

  @override
  _UAccountScreen createState() => _UAccountScreen();
}

class _UAccountScreen extends State<UAccountScreen> {
  late User _currentUser;
  bool dataFetched = false;
  List<List<int>> userData = [[]];
  int _selectedIndex = 2;

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
  final ScrollController _controllerOne = ScrollController();

  @override
  void initState() {
    _currentUser = widget.user;
    getDataFromFirebase();
    super.initState();
  }

  Future<void> getDataFromFirebase() async {
    // var counterTmp = await FirebaseUserClass.getCounters();
    // var messDataTmp =
    //     await FirebaseUserClass.getUserMessDeatils(widget.user.uid);

    userData = await FirebaseUserClass.getUserRecords(widget.user.uid);
    // print(userData.runtimeType);
    setState(() {
      dataFetched = true;
      // counters = counterTmp;
      // messData = messDataTmp;
      // isFirebaseCalled = true;
      // // print(counters[0]);
    });
  }

  Widget createTable() {
    List<DataRow> dataRows = [];
    for (int i = 0; i < userData.length; ++i) {
      dataRows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Text((i + 1).toString()))),
            DataCell(Center(child: Text(userData[i][0].toString()))),
            DataCell(Center(child: Text(userData[i][1].toString()))),
            DataCell(Center(child: Text(userData[i][2].toString()))),
            DataCell(
              Text(DateTime.fromMillisecondsSinceEpoch(userData[i][3] * 1000)
                  .toString()),
            )
          ],
        ),
      );
    }
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'S. No.',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Breakfast',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Lunch',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Dinner',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Timestamp of Donation',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
        ], rows: dataRows));
  }

  Future<void> signOut(BuildContext context) async {
    await FireAuth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      // builder: (context) =>
      //     const SignupScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightGreen,
        appBar: AppBar(
          title: const TitleMonterrsat("Account"),
          backgroundColor: pineGreen,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const [
                            HeaderMontserrat("Your Record"),
                          ],
                        ))),
                const SizedBox(
                  width: 100,
                ),
                StyledButtonMonterrsat(
                    text: "Sign Out", onPressed: () => {signOut(context)}),
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
            dataFetched
                ? Align(
                    alignment: Alignment.center,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: _controllerOne,
                      child: SingleChildScrollView(
                          controller: _controllerOne,
                          child: createTable(),
                          scrollDirection: Axis.horizontal),
                    ))
                : const SpinKitHourGlass(
                    color: Colors.greenAccent,
                    size: 50.0,
                  ),
            const SizedBox(
              height: 30,
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

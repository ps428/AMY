import 'package:amy/authentication_service.dart';
import 'package:amy/constants.dart';
import 'package:amy/routes/admin/abill.dart';
import 'package:amy/routes/admin/ainventory.dart';
import 'package:amy/routes/admin/aserve.dart';
import 'package:amy/routes/home.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../authentication_service.dart';
import 'firebaseAdminClass.dart';

class AHomeScreen extends StatefulWidget {
  final User user;
  
  const AHomeScreen({required this.user});

  @override
  _AHomeScreen createState() => _AHomeScreen();
}

class _AHomeScreen extends State<AHomeScreen> {
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
            builder: (context) => AHomeScreen(user: _currentUser)),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AServeScreen(
                  user: _currentUser,
                )),
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
    getDataFromFirebase();
    super.initState();
  }
  
 Future<void> getDataFromFirebase() async {
    // var counterTmp = await FirebaseUserClass.getCounters();
    // var messDataTmp =
    //     await FirebaseUserClass.getUserMessDeatils(widget.user.uid);

    userData = await FirebaseAdminClass.getUserRecords(widget.user.uid);
    print(userData.runtimeType);
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
            DataCell(Text((i + 1).toString())),
            DataCell(Text(userData[i][0].toString())),
            DataCell(Text(userData[i][1].toString())),
            DataCell(Text(userData[i][2].toString())),
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
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Timestamp of Donation',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ], rows: dataRows));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Admin Home',
          style: TextStyle(color: lightGreen, fontFamily: 'OpenSans'),
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header("Counter and all"),
          const Text(
            'Details: ',
          ),
          const Paragraph(
            'I need to print table here!',
          ),
          StyledButtonPlayfair(
            text: "To bill screen",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ABillScreen(
                    user: _currentUser,
                  ),
                ),
              );
            },
          ),
           
          StyledButtonMonterrsat(
              text: "Log Out",
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    )
                  }),
          const SizedBox(
                  width: 100,
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
                    child: createTable(),
                  )
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
            label: 'Serve Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Show Records',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

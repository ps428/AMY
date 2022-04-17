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
  int _selectedIndex = 0;
  var counters;
  Map<String, Map> billData = {};
  var billID;

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
    var counterTmp = await FirebaseAdminClass.getCounters();
    Map<String, Map> tmpBillData = await FirebaseAdminClass.getBillRecords();
    setState(() {
      dataFetched = true;
      counters = counterTmp;
      billData = tmpBillData;
    });
  }

  Widget createTableBreakfast() {
    List<DataRow> dataRows = [];
    // print(billData['breakfast']);
    int i = 0;
    billData['breakfast']!.forEach((key, value) {
      dataRows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Text((i + 1).toString()))),
            DataCell(Center(child: Text(value!['billID'].toString()))),
            DataCell(Center(child: Text(value!['messID'].toString()))),
            DataCell(Center(child: Text(value!['donationTime'].toString()))),
            DataCell(Center(child: Text(value!['servingTime'].toString()))),
          ],
        ),
      );
      i += 1;
    });
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
              'Bill ID.',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Donor MessID',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Donation Time',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Serving Time',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
        ], rows: dataRows));
  }

  Widget createTableLunch() {
    List<DataRow> dataRows = [];
    // print(billData['breakfast']);
    int i = 0;
    billData['lunch']!.forEach((key, value) {
      dataRows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Text((i + 1).toString()))),
            DataCell(Center(child: Text(value!['billID'].toString()))),
            DataCell(Center(child: Text(value!['messID'].toString()))),
            DataCell(Center(child: Text(value!['donationTime'].toString()))),
            DataCell(Center(child: Text(value!['servingTime'].toString()))),
          ],
        ),
      );
      i += 1;
    });
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
              'Bill ID',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Donor MessID',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Donation Time',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Serving Time',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
        ], rows: dataRows));
  }

  Widget createTableDinner() {
    List<DataRow> dataRows = [];
    // print(billData['breakfast']);
    int i = 0;
    billData['dinner']!.forEach((key, value) {
      dataRows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Center(child: Text((i + 1).toString()))),
            DataCell(Center(child: Text(value!['billID'].toString()))),
            DataCell(Center(child: Text(value!['messID'].toString()))),
            DataCell(Center(child: Text(value!['donationTime'].toString()))),
            DataCell(Center(child: Text(value!['servingTime'].toString()))),
          ],
        ),
      );
      i += 1;
    });
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
              'Bill ID',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Donor MessID',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Donation Time',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Serving Time',
              style: TextStyle(fontFamily: 'Monterrsat'),
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
        title: const TitleMonterrsat(
          'Admin Home',
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          dataFetched
              ? Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
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
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ProgressBar(
                                        value:
                                            counters[0] / (counters[2] / 100),
                                        size: counters[2] / (counters[2] / 100),
                                        counts: counters[0],
                                        total: counters[2],
                                      ),
                                      ParagraphMontserrat("Donated meals " +
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
                                      ParagraphMontserrat("Served meals " +
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
              : const ParagraphMontserrat("Loading Mess Data"),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.center,
            child: ParagraphMontserratLarger2(
              'Donation Record',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          dataFetched
              ? Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExpansionTile(
                        textColor: black,
                        backgroundColor: bgExpand,
                        expandedAlignment: Alignment.center,
                        title: Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Container(
                              height: 50.0,
                              width: 180.0,
                              decoration: const BoxDecoration(
                                  color: mustard,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  HeaderMontserrat("Breakfast"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: createTableBreakfast(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ExpansionTile(
                        textColor: black,
                        backgroundColor: bgExpand,
                        expandedAlignment: Alignment.center,
                        title: Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Container(
                              height: 50.0,
                              width: 180.0,
                              decoration: const BoxDecoration(
                                  color: mustard,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  HeaderMontserrat("Lunch"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: createTableLunch(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ExpansionTile(
                        textColor: black,
                        backgroundColor: bgExpand,
                        expandedAlignment: Alignment.center,
                        title: Stack(
                          alignment: Alignment.center,
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Container(
                              height: 50.0,
                              width: 180.0,
                              decoration: const BoxDecoration(
                                  color: mustard,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  HeaderMontserrat("Dinner"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: createTableDinner(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ))
              : const SpinKitHourGlass(
                  color: Colors.greenAccent,
                  size: 50.0,
                ),
          const SizedBox(
            height: 30,
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

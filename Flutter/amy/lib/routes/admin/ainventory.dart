import 'package:amy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'ahome.dart';
import 'aserve.dart';
import 'firebaseAdminClass.dart';

class AInventoryScreen extends StatefulWidget {
  final User user;
  const AInventoryScreen({required this.user});

  @override
  _AInventoryScreen createState() => _AInventoryScreen();
}

class _AInventoryScreen extends State<AInventoryScreen> {
  int _selectedIndex = 2;
  late User _currentUser;
  bool dataFetched = false;
  late List<int> inventoryData;

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
            builder: (context) => AServeScreen(user: _currentUser)),
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
    inventoryData = await FirebaseAdminClass.getAdminInventory();
    print(inventoryData);
    setState(() {
      dataFetched = true;
    });
  }

  Widget createTable() {
    List<DataRow> dataRows = [];
    dataRows.add(
      DataRow(
        cells: <DataCell>[
          const DataCell(Text("1.")),
          const DataCell(Text("Breakfast")),
          DataCell(Text(inventoryData[0].toString())),
        ],
      ),
    );
    dataRows.add(
      DataRow(
        cells: <DataCell>[
          const DataCell(Text("2.")),
          const DataCell(Text("Lunch")),
          DataCell(Text(inventoryData[1].toString())),
        ],
      ),
    );
    dataRows.add(
      DataRow(
        cells: <DataCell>[
          const DataCell(Text("3.")),
          const DataCell(Text("Dinner")),
          DataCell(Text(inventoryData[2].toString())),
        ],
      ),
    );

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
              'Meal',
              style: TextStyle(fontFamily: 'Monterrsat'),
            ),
          ),
          DataColumn(
            label: Text(
              'Available Servings',
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
          'Inventory',
        ),
        backgroundColor: pineGreen,
      ),
      body: ListView(
        children: <Widget>[
          const HeaderMontserrat("List items"),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          dataFetched
              ? Align(
                  child: createTable(),
                  alignment: Alignment.center,
                )
              : const SpinKitHourGlass(
                  color: Colors.greenAccent,
                  size: 50.0,
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

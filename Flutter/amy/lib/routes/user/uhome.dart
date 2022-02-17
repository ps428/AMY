import 'package:amy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UHomeScreen extends StatefulWidget {
  final User user;

  const UHomeScreen({required this.user});

  @override
  _UHomeScreen createState() => _UHomeScreen();
}

class _UHomeScreen extends State<UHomeScreen> {
  late User _currentUser;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

//  void _onItemTapped(int index) {
//     if (index == 0) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => UHomeScreen(
//             user: _currentUser,
//           ),
//         ),
//       );
//     } else if (index == 1) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => UHomeScreen(
//             user: _currentUser,
//           ),
//         ),
//       );
//     } else if (index == 2) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => UDonateScreen(),
//         ),
//       );
//     }
//   }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          'Donate Food',
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
          const Header("Welcome to AMY"),
          Text(
            'NAME: ${_currentUser.displayName}',
          ),
          const Paragraph(
            'Some cool quote!',
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
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

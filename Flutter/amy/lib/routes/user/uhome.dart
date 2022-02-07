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

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Donate Food',
          style: TextStyle(color: lightGreen, fontFamily: 'OpenSans'),
        ),
        backgroundColor: pineGreen,
      ),
      body: Column(
        children: <Widget>[
          Image.asset('assets/images/hands.jpg'),
          const SizedBox(height: 8),
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
          Row(
            children: [
              Expanded(
                  child: Align(
                heightFactor: .30,
                widthFactor: .30,
                child: StyledButtonOpenSans(
                    text: "Log In",
                    onPressed: () => {Navigator.pushNamed(context, '/login')}),
              )),
              Expanded(
                  child: Align(
                heightFactor: .30,
                widthFactor: .30,
                child: StyledButtonOpenSans(
                    text: "Sign Up",
                    onPressed: () => {Navigator.pushNamed(context, '/signup')}),
              )),
            ],
          ),
        ],
      ),
    );
  }
}

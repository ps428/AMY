import 'package:amy/constants.dart';
import 'package:amy/routes/user/uaccount.dart';
import 'package:amy/routes/user/udonate.dart';
import 'package:amy/routes/user/uhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://media.istockphoto.com/photos/poor-indian-children-asking-for-food-india-picture-id524903696?k=20&m=524903696&s=612x612&w=0&h=lyOsBJSuxpNFYhoFQDrkBjWrMulPnMkQHkhfQWw2Z4g=',
  'https://thumbs.dreamstime.com/b/double-exposure-hunger-begging-hands-dry-soil-represent-lot-people-world-hungry-starvation-need-69057865.jpg',
  'https://media.istockphoto.com/photos/african-girl-eating-a-meal-in-the-orphanage-picture-id108349181?k=20&m=108349181&s=612x612&w=0&h=fgoQ9CW_tHzInBPVLYOPVqZYfp0MQCrB3nBUUTAUetc=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYMw_KObr82gHU8mJiK5w6CyNkYeIDCAZRCg&usqp=CAU'
];

class UThanksScreen extends StatefulWidget {
  final User user;

  const UThanksScreen({required this.user});

  @override
  _UThanksScreen createState() => _UThanksScreen();
}

class _UThanksScreen extends State<UThanksScreen> {
  late User _currentUser;

  int _selectedIndex = 0;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text(
          'Thanks for Donation',
          style: TextStyle(color: lightGreen, fontFamily: 'Playfair'),
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
          HeaderPlayfair(
            'Thank you ${_currentUser.displayName}!',
          ),
          const SizedBox(
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          const ParagraphPlayfair("A Meal by You! "),
          CarouselSlider(
            options: CarouselOptions(),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
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
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserClass {
  static CollectionReference userDonations =
      FirebaseFirestore.instance.collection('userDonations');

  static Future<List> getCounters() async {
    var returnList = [];
    var tmp;
    await FirebaseFirestore.instance
        .collection('globalCounters')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        // print(result.data());
        tmp = result.data();
      });
    });
    returnList.add(tmp['mealsDonated']);
    returnList.add(tmp['mealsServed']);

    return returnList;
  }

  static Future<List> getUserMessDeatils(String uID) async {
    var returnList;
    var tmp;
    await FirebaseFirestore.instance
        .collection('messData')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (result.data()['uID'] == uID) {
          // print(result.data());
          tmp = result.data();
        }
      });
    });
    returnList = [];
    returnList.add(tmp['full_name']);
    returnList.add(tmp['messID']);
    returnList.add(tmp['balance']);
    print(returnList);
    return returnList;
  }
}

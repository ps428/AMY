import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserClass {
  static CollectionReference messData =
      FirebaseFirestore.instance.collection('messData');

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

    // mealsDonated
    // print(returnList);
    // Map<String, dynamic> data = userDonations.;
    print(returnList);
    return returnList;
  }

  static Future<List> getUserMessDeatils(String uID) async {
    //TODO read data from firestore
    messData
        .doc(uID)
        .set({
          'uID': uID, // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    return [];
  }
}

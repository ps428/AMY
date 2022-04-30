import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static CollectionReference messData =
      FirebaseFirestore.instance.collection('messData');

  static CollectionReference userRecord =
      FirebaseFirestore.instance.collection('userDonations');

  static Future<void> addUser(String uID, String fullName, String messID,
      String phoneNumber, String email) async {
    // Call the user's CollectionReference to add a new user
    users
        .doc(uID)
        .set({
          'uID': uID, // John Doe
          'full_name': fullName, // John Doe
          'messID': messID, // Stokes and Sons
          'phone': phoneNumber, // 42
          'email': email // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> addUserMess(String uID, String fullName, String messID,
      String phoneNumber, String email) async {
    // Call the user's CollectionReference to add a new user
    messData
        .doc(uID)
        .set({
          'uID': uID, // John Doe
          'full_name': fullName, // John Doe
          'messID': messID, // Stokes and Sons
          'balance': 3800
        })
        .then((value) => print("Mess Data Added"))
        .catchError((error) => print("Failed to update mess data: $error"));
  }

  static Future<void> addUserRecord(String uID) async {
    // Call the user's CollectionReference to add a new user
    userRecord
        .doc(uID)
        .set({'newAdditon': 'tmp_data'})
        .then((value) => print("Pesonal record Data Added"))
        .catchError(
            (error) => print("Failed to update personal record data: $error"));
  }
}

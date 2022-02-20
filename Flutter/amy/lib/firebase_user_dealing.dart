import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

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
}

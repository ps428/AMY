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
    returnList.add(tmp['targetDonation']);

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
    // print(returnList);
    return returnList;
  }

  static void updateDonations(String uID, List l) async {
    updateUserRecord(uID, l);
    updateAdminInventory(uID, l);
    updateUserMessData(uID, l);
    updateCountersDonated(l);
  }

  static void updateCountersDonated(List l) async {
    var collection =
        await FirebaseFirestore.instance.collection('globalCounters');

    var counters = await getCounters();
    // print('----------------------------');
    // print(counters);
    var currentDonations = counters[0];
    // print(currentDonations);
    currentDonations += l[2] + l[3] + l[4];
    // print(currentDonations);

    var a = collection.doc('AMYFoodCounters').update({
      'mealsDonated': currentDonations,
    });
    // print(a);

    // collection.doc('AMYFoodCounters').set({'mealsDonated': 1});
  }

  static void updateUserMessData(String uID, List l) async {
    var collection = await FirebaseFirestore.instance.collection('messData');

    var newBalance = l[0];

    collection.doc(uID).update({'balance': newBalance});
  }

  static void updateAdminInventory(String uID, List l) async {
    var collection =
        await FirebaseFirestore.instance.collection('adminInventory');

    var messData = await getUserMessDeatils(uID);

    for (int i = 0; i < l[2]; i++) {
      Map<String, dynamic>? newEntryBf = {
        'Donation Time': DateTime.now(),
        'UID': uID,
        'Status': 'Available',
        'Name': messData[0].toString(),
        'Mess ID': messData[1].toString()
      };
      var collectionID = DateTime.now().toString();
      await collection
          .doc('adminBreakfast')
          .collection(collectionID)
          .doc('Donation')
          .set(newEntryBf);
    }
    for (int i = 0; i < l[3]; i++) {
      Map<String, dynamic>? newEntryLunch = {
        'Donation Time': DateTime.now(),
        'UID': uID,
        'Status': 'Available',
        'Name': messData[0].toString(),
        'Mess ID': messData[1].toString()
      };
      var collectionID = DateTime.now().toString();
      await collection
          .doc('adminLunch')
          .collection(collectionID)
          .doc('Donation')
          .set(newEntryLunch);
    }
    for (int i = 0; i < l[4]; i++) {
      Map<String, dynamic>? newEntryDinner = {
        'Donation Time': DateTime.now(),
        'UID': uID,
        'Status': 'Available',
        'Name': messData[0].toString(),
        'Mess ID': messData[1].toString()
      };
      var collectionID = DateTime.now().toString();
      await collection
          .doc('adminDinner')
          .collection(collectionID)
          .doc('Donation')
          .set(newEntryDinner);
    }
  }

  static void updateUserRecord(String uID, List l) async {
    var collection =
        await FirebaseFirestore.instance.collection('userDonations');

    Map<String, dynamic>? newEntry = {
      'Donation Time': DateTime.now(),
      'Breakfast': l[2],
      "Lunch": l[3],
      "Dinner": l[4],
    };
    var collectionID = DateTime.now().toString();
    collection.doc(uID).collection(collectionID).doc('Donation').set(newEntry);
  }
}

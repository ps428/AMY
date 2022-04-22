import 'dart:collection';
import 'dart:convert';

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
    // print(l);
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

    var currentTime = DateTime.now();
    // print(currentTime);
    for (int i = 0; i < l[2]; i++) {
      Map<String, dynamic>? newEntryBf = {
        currentTime.add(Duration(seconds: i)).toString(): {
          'Donation Time': DateTime.now().toString(),
          'UID': uID,
          'Status': 'Available',
          'Name': messData[0].toString(),
          'Mess ID': messData[1].toString()
        }
      };
      await collection.doc('adminBreakfast').update(newEntryBf);
    }
    for (int i = 0; i < l[3]; i++) {
      Map<String, dynamic>? newEntryLunch = {
        currentTime.add(Duration(seconds: i)).toString(): {
          'Donation Time': DateTime.now().toString(),
          'UID': uID,
          'Status': 'Available',
          'Name': messData[0].toString(),
          'Mess ID': messData[1].toString()
        }
      };
      await collection.doc('adminLunch').update(newEntryLunch);
    }
    for (int i = 0; i < l[4]; i++) {
      Map<String, dynamic>? newEntryDinner = {
        currentTime.add(Duration(seconds: i)).toString(): {
          'Donation Time': DateTime.now().toString(),
          'UID': uID,
          'Status': 'Available',
          'Name': messData[0].toString(),
          'Mess ID': messData[1].toString()
        }
      };
      await collection.doc('adminDinner').update(newEntryDinner);
    }
  }

  static void updateUserRecord(String uID, List l) async {
    var collection =
        await FirebaseFirestore.instance.collection('userDonations');
    var currentTime = DateTime.now().toString();

    Map<String, dynamic>? newEntry = {
      currentTime: {
        'Donation Time': DateTime.now(),
        'Breakfast': l[2],
        "Lunch": l[3],
        "Dinner": l[4],
      }
    };
    var fieldKeyTime = DateTime.now().toString();
    await collection.doc(uID).update(newEntry);
  }

  static Future<List<List<int>>> getUserRecords(String uID) async {
    // list of list with bf, lunch, dinner and timestamp as elements,
    // [[b,l,d,time],[b,l,d,time]]
    List<List<int>> tmpReturnList = [];
    // var tmp;
    print("generating records....");
    var donationData = await FirebaseFirestore.instance
        .collection('userDonations')
        .doc(uID)
        .get();
    var mappedData = await donationData.data();
    mappedData?.forEach((key, value) {
      // print(value.runtimeType);
      var data = value.toString();
      if (data != 'tmp_data') {
        var hashedData = HashMap.from(value);
        hashedData.forEach((key, val) {
          var listData = val
              .toString()
              .substring(1, val.toString().length - 1)
              .split(", ")
            ..sort();
          // listData.sort();
          // print(listData);

          var bf = int.parse(listData[0].split(": ")[1]);
          var lunch = int.parse(listData[3].split(": ")[1]);
          var dinner = int.parse(listData[1].split(": ")[1]);
          var time = int.parse(listData[2].split("=")[1]);

          var finalList = [
            bf,
            dinner,
            lunch,
            time,
          ];
          // print(finalList);

          tmpReturnList.add(finalList);
          //just have to show this data on a table now, yo
        });
      }
      // print(key.toString() + " : " + value.toString());
    });

    List<List<int>> returnList = [];
    Map<int, int> timeData = {};
    for (int i = 0; i < tmpReturnList.length; i++) {
      timeData[i] = tmpReturnList[i][3];
    }

    // print(returnList);
    return tmpReturnList;
  }
}

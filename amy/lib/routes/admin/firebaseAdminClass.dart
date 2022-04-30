import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAdminClass {
  static Future<List<List<int>>> getUserRecords(String uID) async {
    // list of list with bf, lunch, dinner and timestamp as elements,
    // [[b,l,d,time],[b,l,d,time]]
    List<List<int>> tmpReturnList = [];
    // var tmp;
    // print("generating records....");
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

  static Future<List<int>> getAdminInventory() async {
    int bfCounts = await getMealSum("adminBreakfast");
    int lunchCounts = await getMealSum("adminLunch");
    int dinnerCounts = await getMealSum("adminDinner");
    List<int> returnData = [bfCounts, lunchCounts, dinnerCounts];
    return returnData;
  }

  static Future<int> getMealSum(String s) async {
    int counts = 0;
    var mealData = await FirebaseFirestore.instance
        .collection('adminInventory')
        .doc(s)
        .get();
    mealData.data()?.forEach((key, value) {
      counts++;
    });

    return counts - 1;
  }

//TODO notification part
  static Future<Map<String, dynamic>> serveMeal(String s) async {
    Map<String, dynamic> details = await getMealDetailsFromInventory(s);
    //delete from inventory: called in get function
    // print(details);

    //add to bill table
    addToBillRecords(details, s);

    //notify user:TODO cloud messenging
    sendNotification(details['UID']);
    //counter ++
    updateCountersDonated();
    // DONE:**keep track of this data returned in first step to print this in the bill */
    return details;
  }

  static Future<Map<String, dynamic>> getMealDetailsFromInventory(
      String s) async {
    Map<String, dynamic> details = {};
    var inventoryData = await FirebaseFirestore.instance
        .collection("adminInventory")
        .doc(s)
        .get();

    var mappedData = await inventoryData.data();
    var firstServe = mappedData?.keys.first;
    var serveDetails = mappedData?[firstServe];

    serveDetails?.forEach((key, value) {
      // print(value.runtimeType);
      // print(value);
      details = value;
    });
    // print(mappedData?.length);

    mappedData?.remove(firstServe);
    // print(mappedData?.length);

    //deleting from inventory
    deleteEntryFromInventory(mappedData!, s);

    return details;
  }

  static Future<void> deleteEntryFromInventory(
      Map<String, dynamic> mappedData, String s) async {
    await FirebaseFirestore.instance
        .collection("adminInventory")
        .doc(s)
        .set(mappedData);
  }

  static Future<void> addToBillRecords(
      Map<String, dynamic> details, String s) async {
    var currentTime = DateTime.now();
    Map<String, dynamic> data = {};
    details['Serving Time'] = currentTime.toString();
    details['Meal Type'] = s;
    Timestamp now = Timestamp.fromDate(currentTime);

    details['Bill ID'] = now.seconds.toString();

    data[currentTime.toString()] = details;

    await FirebaseFirestore.instance
        .collection("adminBills")
        .doc(s)
        .update(data);
  }

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

  static void sendNotification(String UID) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    var data =
        await FirebaseFirestore.instance.collection("users").doc(UID).get();
    var userData = data.data();
    // TODO Add custom mail
    _firebaseAuth.sendPasswordResetEmail(email: userData!['email']);
  }

  static void updateCountersDonated() async {
    var collection =
        await FirebaseFirestore.instance.collection('globalCounters');

    var counters = await getCounters();
    // print('----------------------------');
    // print(counters);
    var currentServings = counters[1];
    // print(currentDonations);
    currentServings += 1;
    // print(currentDonations);

    var a = collection.doc('AMYFoodCounters').update({
      'mealsServed': currentServings,
    });
    // print(a);

    // collection.doc('AMYFoodCounters').set({'mealsDonated': 1});
  }

  static Future<Map<String, Map>> getBillRecords() async {
    Map<String, Map> billData = {};
    billData['breakfast'] = await getMealWiseBillRecords('adminBreakfast');
    billData['lunch'] = await getMealWiseBillRecords('adminLunch');
    billData['dinner'] = await getMealWiseBillRecords('adminDinner');
    return billData;
  }

  static Future<Map<String, dynamic>> getMealWiseBillRecords(String s) async {
    Map<String, dynamic> returnData = {};

    var billDataJSON =
        await FirebaseFirestore.instance.collection('adminBills').doc(s).get();

    var mappedData = await billDataJSON.data();
    // print(billDataJSON);
    mappedData?.forEach((key, value) {
      // print(value.runtimeType);
      var data = value.toString();
      var hashedData = HashMap.from(value);
      hashedData.forEach((key, val) {
        var listData = val
            .toString()
            .substring(1, val.toString().length - 1)
            .split(", ")
          ..sort();
        // listData.sort();
        // print(listData);
        // for (int i = 0; i < listData.length; i++) print(listData[i]);
        var billID = listData[0].split(": ")[1];
        var donationTime = listData[1].split(": ")[1];
        var messID = listData[3].split(": ")[1];
        var name = listData[4].split(": ")[1];
        var servingTime = listData[5].split(": ")[1];
        var UID = listData[7].split(": ")[1];

        Map<String, dynamic> tmp = {};

        tmp['billID'] = billID;
        tmp['donationTime'] = donationTime;
        tmp['messID'] = messID;
        tmp['name'] = name;
        tmp['servingTime'] = servingTime;
        tmp['UID'] = UID;
        tmp['mealType'] = s;
        returnData[servingTime] = tmp;
        // var finalList = [
        //   bf,
        //   dinner,
        //   lunch,
        //   time,
        // ];
        // print(finalList);

        //just have to show this data on a table now, yo
      });
    });
    return returnData;
  }
}

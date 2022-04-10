import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminClass {
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

  static void serveMeal(String s) async {
    //get inventory
    //delete from inventory
    //add to bill table
    //notify user
    //counter ++
    //**keep track of this data returned in first step to print this in the bill */
  }

  static Future<List<int>> getMealDetailsFromInventory(String s) async {
    List<int> details = [];
    var inventoryData = await FirebaseFirestore.instance
        .collection("adminInventory")
        .doc(s)
        .get();

    return details;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FetchData with ChangeNotifier {
  bool loading = false;
  final String uri = "https://pycare-api.herokuapp.com";
  int sortItem;

  Map status;
  List hospitalDetails;
  List hospitalDetailsSortO;
  List hospitalDetailsSortV;
  List hospitalDetailsSortI;

  FetchData() {
    check();
    // getAllData();
    // sortThing(0);
  }

  void check() async {
    loading = true;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String value = sharedPreferences.getString("updateData");

    if (value != null) {
      DateTime dateTime = DateTime.parse(value);
      if (DateTime.now().difference(dateTime) == Duration(days: 1)) {
        print("UPDATING DATA");
        await http.get(Uri.parse(uri + "/updateData"));

        getAllData();
        sortThing(2);
        await sharedPreferences.setString(
            "updateData", DateTime.now().toString());
      } else {
        print("READING FROM LOCAL");

        getAllDataFromSP();
        sortThing(2);
      }
    } else {
      print("NULL, UPDATING DATA");

      getAllData();
      sortThing(2);
      await sharedPreferences.setString(
          "updateData", DateTime.now().toString());
    }

    // loading = false;
    // notifyListeners();
  }

  getAllDataFromSP() async {
    loading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    status = jsonDecode(sharedPreferences.getString("status"))[0];
    hospitalDetails =
        jsonDecode(sharedPreferences.getString("hospitalDetails"));
    hospitalDetails = hospitalDetails.reversed.toList();
    hospitalDetailsSortO =
        jsonDecode(sharedPreferences.getString("hospitalDetailsSortO"));
    hospitalDetailsSortV =
        jsonDecode(sharedPreferences.getString("hospitalDetailsSortV"));
    hospitalDetailsSortI =
        jsonDecode(sharedPreferences.getString("hospitalDetailsSortI"));

    loading = false;
    notifyListeners();
  }

  getAllData() async {
    // loading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    http.Response response = await http.get(Uri.parse(uri + "/status"));
    await sharedPreferences.setString("status", response.body);
    status = jsonDecode(sharedPreferences.getString("status"))[0];

    http.Response response1 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=hospitalName"));
    await sharedPreferences.setString("hospitalDetails", response1.body);
    hospitalDetails =
        jsonDecode(sharedPreferences.getString("hospitalDetails"));
    // hospitalDetails = jsonDecode(response1.body);

    hospitalDetails = hospitalDetails.reversed.toList();

    http.Response response2 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=oxygenBeds"));
    await sharedPreferences.setString("hospitalDetailsSortO", response2.body);
    hospitalDetailsSortO =
        jsonDecode(sharedPreferences.getString("hospitalDetailsSortO"));
    // hospitalDetailsSortO = jsonDecode(response2.body);

    http.Response response3 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=ventilatorBeds"));
    await sharedPreferences.setString("hospitalDetailsSortV", response3.body);
    hospitalDetailsSortV =
        jsonDecode(sharedPreferences.getString("hospitalDetailsSortV"));
    // hospitalDetailsSortV = jsonDecode(response3.body);

    http.Response response4 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=isolationBeds"));
    await sharedPreferences.setString("hospitalDetailsSortI", response4.body);
    hospitalDetailsSortI =
        jsonDecode(sharedPreferences.getString("hospitalDetailsSortI"));
    // hospitalDetailsSortI = jsonDecode(response4.body);

    loading = false;
    notifyListeners();
  }

  void sortThing(int sortItem) {
    this.sortItem = sortItem;
    switch (sortItem) {
      case 0:

        /// oxygenbeds
        hospitalDetails = hospitalDetailsSortO;
        break;
      case 1:

        /// ventilatorbeds
        hospitalDetails = hospitalDetailsSortV;
        break;
      case 2:

        /// isolationbeds
        hospitalDetails = hospitalDetailsSortI;
        break;
    }
    notifyListeners();
  }

//   getStatusData() async {
//     loading = true;
//
//     http.Response response = await http.get(Uri.parse(uri + "/status"));
//     status = jsonDecode(response.body)[0];
//
//     loading = false;
//     notifyListeners();
//   }
//
//   getHospitalData() async {
//     loading = true;
//
//     http.Response response =
//         await http.get(Uri.parse(uri + "/hospitalDetails"));
//     hospitalDetails = jsonDecode(response.body);
//
//     print(hospitalDetails);
//
//     loading = false;
//     notifyListeners();
//   }
}

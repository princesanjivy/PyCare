import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchData with ChangeNotifier {
  bool loading = false;
  final String uri = "https://pycare-api.herokuapp.com";

  Map status;
  List hospitalDetails;
  List hospitalDetailsSortO;
  List hospitalDetailsSortV;
  List hospitalDetailsSortI;

  FetchData() {
    getAllData();
  }

  getAllData() async {
    loading = true;

    http.Response response = await http.get(Uri.parse(uri + "/status"));
    status = jsonDecode(response.body)[0];

    http.Response response1 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=hospitalName"));
    hospitalDetails = jsonDecode(response1.body);

    hospitalDetails = hospitalDetails.reversed.toList();

    http.Response response2 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=oxygenBeds"));
    hospitalDetailsSortO = jsonDecode(response2.body);

    http.Response response3 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=ventilatorBeds"));
    hospitalDetailsSortV = jsonDecode(response3.body);

    http.Response response4 =
        await http.get(Uri.parse(uri + "/hospitalDetails?sort=isolationBeds"));
    hospitalDetailsSortI = jsonDecode(response4.body);

    loading = false;
    notifyListeners();
  }

  void sortThing(int sortItem) {
    switch (sortItem) {
      case 0:
        hospitalDetails = hospitalDetailsSortO;
        break;
      case 1:
        hospitalDetails = hospitalDetailsSortV;
        break;
      case 2:
        hospitalDetails = hospitalDetailsSortI;
        break;
    }
    notifyListeners();
  }

  getStatusData() async {
    loading = true;

    http.Response response = await http.get(Uri.parse(uri + "/status"));
    status = jsonDecode(response.body)[0];

    loading = false;
    notifyListeners();
  }

  getHospitalData() async {
    loading = true;

    http.Response response =
        await http.get(Uri.parse(uri + "/hospitalDetails"));
    hospitalDetails = jsonDecode(response.body);

    print(hospitalDetails);

    loading = false;
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_system/screens/model/modelclass/modelclass.dart';

class JsonProvider extends ChangeNotifier {
  List dataList = [];
  List<Planets> objectList = [];
  int index = 0;
  int Index = 0;

  JsonProvider() {
    jsonCall();
  }

  Future<void> jsonCall() async {
    String json = await rootBundle.loadString('assets/json/solarsystem.json');
    dataList = jsonDecode(json);
    objectList = dataList
        .map(
          (e) => Planets.fromJson(e),
        )
        .toList();
    notifyListeners();
  }

  void pageChanged(index) {
    this.index = index;
    notifyListeners();
  }

  void changeIndex(index) {
    this.Index = index;
    notifyListeners();
  }

  void next() {
    if (this.Index == 8) {
      this.Index = 0;
      notifyListeners();
    } else {
      this.Index += 1;
      notifyListeners();
    }
  }

  void back() {
    if (this.Index == 0) {
      this.Index = 8;
      notifyListeners();
    } else {
      this.Index -= 1;
      notifyListeners();
    }
  }
}

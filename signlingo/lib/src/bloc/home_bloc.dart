import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:signlingo/src/database/home_database.dart';

class HomeBloc {
  static List<String> dynamicToStringList(List<dynamic> dynamicList) {
    List<String> stringList = dynamicList.map((e) => e.toString()).toList();
    // Kiểm tra và chuyển đổi từ dynamic sang String
    return stringList;
  }

  static bool _isRequiring = false;
  static Future<bool> newUnit(int currentUnit, int weight) async {
    if (_isRequiring) return false;
    _isRequiring = true;
    int newUnit = currentUnit + weight;
    int total = await HomeData.getNumberDocument("scenario");
    _isRequiring = false;
    return (0 < newUnit && newUnit <= total);
  }

  static int caculateProgress(Map<String, dynamic> unit, int chapter) {
    if (unit.containsKey('$chapter')) {
      Map<String, dynamic> thisChapter = unit['$chapter'];
      return thisChapter.length;
    }
    return 0;
  }

}

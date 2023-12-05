import 'package:flutter/material.dart';

class HomeBloc {
  static List<String> dynamicToStringList(List<dynamic> dynamicList) {
    List<String> stringList = dynamicList.map((e) => e.toString()).toList();
// Kiểm tra và chuyển đổi từ dynamic sang String

    return stringList;
  }
}

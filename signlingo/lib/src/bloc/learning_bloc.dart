import 'dart:async';

import 'package:camera/camera.dart';
import 'package:signlingo/src/validators/validations.dart';

class LearningBloc {
  StreamController _checkController = new StreamController();
  Stream get checkStream => _checkController.stream;

  Future<bool> isCorrectVideo(XFile file, String name) async {
    bool status = await Validations.isCorrectVideo(file, name);
    if (!status) {
      _checkController.sink.addError("Incorrect!");
      return false;
    }
    _checkController.sink.add("Correct!");
    return true;
  }

  static List<String> dynamicToStringList(List<dynamic> dynamicList) {
    List<String> stringList = dynamicList.map((e) => e.toString()).toList();
    // Kiểm tra và chuyển đổi từ dynamic sang String
    return stringList;
  }

  void dispose() {
    _checkController.close();
  }

  static String toUpper(String temp) {
    return temp.toUpperCase();
  }

  static String toLower(String temp) {
    return temp.toLowerCase();
  }
}

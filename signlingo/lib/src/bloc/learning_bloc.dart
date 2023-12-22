import 'dart:async';

import 'package:camera/camera.dart';
import 'package:signlingo/src/validators/validations.dart';

import 'package:http/http.dart' as http;

fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

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

  Future<bool> checkString(String answer, String correct) async {
    return toUpper(answer.trim()) == toUpper(correct.trim());
  }

  Future<bool> checkIndex(int selected, int correct) async {
    return selected >= 0 && correct == selected;
  }

  static String toUpper(String temp) {
    return temp.toUpperCase();
  }

  static String toLower(String temp) {
    return temp.toLowerCase();
  }

//   static Future<void> moveFile(String src, String des) {
//     String videoPath = src;
//     String 
//   }
}

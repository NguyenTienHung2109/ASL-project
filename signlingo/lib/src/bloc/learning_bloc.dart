import 'dart:async';

import 'package:camera/camera.dart';
import 'package:signlingo/src/validators/validations.dart';

class LearningBloc {
  StreamController _checkController = new StreamController();
  Stream get checkStream => _checkController.stream;

  Future<bool> isCorrectVideo(XFile file, String name) async{
    bool status = await Validations.isCorrectVideo(file, name);
    if (!status) {
      _checkController.sink.addError("Incorrect!");
      return false;
    }
    _checkController.sink.add("Correct!");
    return true;
  }

  void dispose() {
    _checkController.close();
  }
}

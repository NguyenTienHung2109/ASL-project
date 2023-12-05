import 'dart:async';
import 'package:camera/camera.dart';
import 'package:signlingo/src/validators/validations.dart';

class LearningBloc {
  final StreamController _checkController = StreamController();
  Stream get checkStream => _checkController.stream;

  bool isCorrectVideo(XFile file, String name) {
    if (!Validations.isCorrectVideo(file, name)) {
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

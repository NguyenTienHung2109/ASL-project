import 'dart:async';

import 'package:signlingo/src/validators/validations.dart';

class QuizBloc {
  StreamController _quizController = new StreamController();

  Stream get checkStream => _quizController.stream;

  bool isCheck(bool key, String? answer) {
    if (!Validations.isValidQuiz(key, answer)) {
      _quizController.sink.addError("Đáp án sai");
      return false;
    }
    _quizController.sink.add("ok");
    return true;
  }

  void dispose() {
    _quizController.close();
  }
}

import 'dart:async';

import 'package:signlingo/src/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }

    if (!Validations.isValidPassword(password)) {
      _passController.sink.addError("Mật khẩu không đúng định dạng");
      return false;
    }
    _passController.sink.add("ok");
    _userController.sink.add("ok");
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}

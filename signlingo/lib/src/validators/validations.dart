import 'package:camera/camera.dart';
class Validations {
  static bool isValidUser(String user) {
    return true;
    // code here
    // return user.length > 6 && user.contains('@');
  }

  static bool isValidPassword(String pass) {
    return true;
    // Code here
    return pass.length > 6;
  }

  static bool isValidPassword2(String pass, String pass2) {
    // Code here
    return pass == pass2;
  }

  static bool isCorrectVideo(XFile path, String name) {
    return true;
  }
}

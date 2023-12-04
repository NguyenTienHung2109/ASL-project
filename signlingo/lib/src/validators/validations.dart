class Validations {
  static bool isValidUser(String user) {
    // code here
    return user != null && user.length > 6 && user.contains('@');
  }

  static bool isValidPassword(String pass) {
    // Code here
    return pass != null && pass.length > 6;
  }

  static bool isValidPassword2(String pass, String pass2) {
    // Code here
    return pass == pass2;
  }

  static bool isValidQuiz(bool key) {
    return key;
  }
}

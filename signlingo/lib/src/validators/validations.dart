import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

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

  static bool isValidQuiz(bool key, String? answer) {
    return key && answer != null;
  }

  static Future<bool> isCorrectVideo(XFile path, String name) async {
    return true;
    // var apiUrl = Uri.parse('https://your-server.com/upload-video');
    // var request = http.MultipartRequest('POST', apiUrl);

    // var videoStream = http.ByteStream(path.openRead());
    // var videoLength = await path.length();
    // request.files.add(http.MultipartFile('video', videoStream, videoLength,
    //     filename: '$name.mp4'));
    // var response = await http.Response.fromStream(await request.send());
    // if (response.statusCode == 200) {
    //   print('Video uploaded successfully');
    //   return true;
    // }
    // print('Failed to upload video. Status code: ${response.statusCode}');
    // return false;
  }
}

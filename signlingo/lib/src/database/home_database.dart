import 'package:cloud_firestore/cloud_firestore.dart';

class HomeData {
  static FirebaseFirestore database = FirebaseFirestore.instance;

  // static Map<String, dynamic> getUserData(String username) {
  //   final docRef = database.collection("user_info").doc(username);
  //   Map<String, dynamic> result = {};
  //   docRef.get().then((DocumentSnapshot doc) {
  //     result = doc.data() as Map<String, dynamic>;
  //   }, onError: (e) => print("Error: $e"));
  //   return result;
  // }

  static Future<Map<String, dynamic>> getAllChapter(String unit) async {
    final docRef = database.collection("scenario").doc("Unit $unit");
    print(docRef);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        return result;
      } else {
        print("Document does not exist");
        return {};
      }
    } catch (e) {
      print("Error: $e");
      return {};
    }
  }
}

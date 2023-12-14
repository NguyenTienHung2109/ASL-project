import 'package:cloud_firestore/cloud_firestore.dart';

class DictData {
  static Future<Map<String, dynamic>> getLetter(String letter) async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection("Dictionary").doc(letter);
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
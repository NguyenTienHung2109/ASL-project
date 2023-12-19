import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signlingo/src/bloc/learning_bloc.dart';

class LearningData {

  static Future<List<dynamic>> getPart(
      int unit, int chapter, String part) async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection("scenario_detail").doc("Unit $unit");
    // print(docRef);
    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        print(result);
        if (result.containsKey("Chapter $chapter")) {
          result = result["Chapter $chapter"];
          if (result.containsKey(part)) {
            print(result[part]);
            return result[part];
          }
        }
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error: $e");
    }
    return [];
  }
}

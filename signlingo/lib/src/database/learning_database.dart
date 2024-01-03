import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        // print(result);
        if (result.containsKey("Chapter $chapter")) {
          result = result["Chapter $chapter"];
          if (result.containsKey(part)) {
            // print(result[part]);
            return result[part];
          }
        }
      } else {
        // print("Document does not exist");
      }
    } catch (e) {
      // print("Error: $e");
    }
    return [];
  }

  static Future<void> createUser() async{
    final currentUser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection("user").doc(currentUser.email);
    try {
      docRef.set({
        'check': true,
      },
        SetOptions(merge: true)
      );
    }
    catch (e) {
      // print(e);
    }
  }

  static Map<String, dynamic> _merge(Map<String, dynamic> result, int unit, int chapter, String part) {
    Map<String, dynamic> thisUnit = {};
    Map<String, dynamic> thisChapter = {};
    if (result.containsKey('$unit')) {
      thisUnit = result['$unit'];
    }
    if (thisUnit.containsKey('$chapter')) {
      thisChapter = thisUnit['$chapter'];
    }
    thisChapter[part] = true;
    thisUnit['$chapter'] = thisChapter;
    result['$unit'] = thisUnit;
    return result;
  }

  static Future<void> updateProgress(int unit, int chapter, String part) async {
    await createUser();
    final currentUser = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection("user").doc(currentUser.email);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        await docRef.set(_merge(result, unit, chapter, part));
      } else {
      }
    } catch (e) {
      // Xử lý lỗi ở đây
      print("Error: $e");
      print("Error details: ${e.toString()}");
    }
  }


}

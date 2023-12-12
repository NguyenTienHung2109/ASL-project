import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signlingo/src/bloc/learning_bloc.dart';

class LearningData {
  static Future<Map<String, dynamic>> getVideo(String word) async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    if (word.isEmpty) return {};
    String upper = LearningBloc.toUpper(word);
    final docRef = database.collection("Dictionary").doc(upper[0]);
    print(docRef);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        print(result);
        print(result[LearningBloc.toLower(word)]);
        print(LearningBloc.toLower(word));
        if (result.containsKey(LearningBloc.toLower(word))) {
          return result[LearningBloc.toLower(word)];
        }
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error: $e");
    }
    return {};
  }
}

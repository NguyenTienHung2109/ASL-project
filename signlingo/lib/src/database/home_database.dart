import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeData {

  // static Map<String, dynamic> getUserData(String username) {
  //   final docRef = database.collection("user_info").doc(username);
  //   Map<String, dynamic> result = {};
  //   docRef.get().then((DocumentSnapshot doc) {
  //     result = doc.data() as Map<String, dynamic>;
  //   }, onError: (e) => print("Error: $e"));
  //   return result;
  // }
  static Future<Map<String, dynamic>> getAllChapter(String unit) async {
    FirebaseFirestore database = FirebaseFirestore.instance;
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

  static Future<int> getNumberDocument(String collecion) async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection(collecion);
    try {
      QuerySnapshot querySnapshot = await docRef.get();
      int document = querySnapshot.size;
      return document;
    } catch (e) {
      print('Error: $e');
    }
    return 0;
  }

  static Future<Map<String, dynamic>> getStatusPart(int unit, int chapter) async {
    final user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection('user').doc(user.email);
    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        if (result.containsKey('$unit')) {
          Map<String, dynamic> thisUnit = result['$unit'];
          return thisUnit['$chapter'];
        }
      }
    }
    catch (e) {
      //
    }
    return {};
  }

  static Future<Map<String, dynamic>> getStatusChapter(int unit) async {
    final user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore database = FirebaseFirestore.instance;
    final docRef = database.collection('user').doc(user.email);
    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        return result['$unit'];
      }
    }
    catch (e) {
      //
    }
    return {};
  }

}

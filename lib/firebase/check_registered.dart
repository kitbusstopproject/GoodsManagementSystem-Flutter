import 'package:cloud_firestore/cloud_firestore.dart';

class CheckRegistered {
  static late bool exist;

  static Future<bool> checkExist(String docID) async {
    try {
      await FirebaseFirestore.instance.collection("items").doc(docID).get().then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }
}

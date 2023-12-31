import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateFireStore {
  static String itemId = "";
  static String lendingId = "";
  static updateLendingItem(itemId, lending_log_id) async {
    final db = FirebaseFirestore.instance;

    final lendingItem = <String, dynamic>{
      "is_lending": true,
      "lending_log_id": lending_log_id,
    };

    // Add a new document with a generated ID
    await db.collection("items").doc(itemId).update(lendingItem);
  }

  static updateReturningItem(itemId) async {
    final db = FirebaseFirestore.instance;

    final lendingItem = <String, dynamic>{
      "is_lending": false,
    };

    // Add a new document with a generated ID
    await db.collection("items").doc(itemId).update(lendingItem);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class GetFireStore {
  static dynamic category;
  static List<String> categories = [];
  static Future<void> getCategory() async {
    final db = FirebaseFirestore.instance
        .collection("category")
        .doc("dHYjCU0ycy2zJx8NNu77");
    final dynamic categorySnapshot = await db.get();
    final dynamic categoryList =
        categorySnapshot.exists ? categorySnapshot.data()! : null;
    category = categoryList;
    category.forEach((key, value) {
      categories.add(value);
    });
  }

  static Future<dynamic> getItem(String itemId) async {
    final db = FirebaseFirestore.instance.collection("items").doc(itemId);
    final dynamic itemSnapshot = await db.get();
    final dynamic itemCollection =
        itemSnapshot.exists ? itemSnapshot.data()! : null;
    return itemCollection;
  }

  static Future<dynamic> getLendingLog(String lendingLogId) async {
    final db = FirebaseFirestore.instance.collection("lending_logs").doc(lendingLogId);
    final dynamic lendingLogSnapshot = await db.get();
    final dynamic lendingLogCollection =
        lendingLogSnapshot.exists ? lendingLogSnapshot.data()! : null;
    return lendingLogCollection;
  }
}

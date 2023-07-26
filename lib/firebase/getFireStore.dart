import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    debugPrint("=====================================");
    debugPrint(category.length.toString());
    category.forEach((key, value) {
      debugPrint("$key -----$value");
      categories.add(value);
    });
  }

  static Future<dynamic> getItem(String itemId) async {
    final db = FirebaseFirestore.instance.collection("items").doc(itemId);
    final dynamic itemSnapshot = await db.get();
    final dynamic itemCollection =
        itemSnapshot.exists ? itemSnapshot.data()! : null;
    // debugPrint(itemCollection.toString());
    return itemCollection;
  }
}

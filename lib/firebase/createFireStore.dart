import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateFireStore {
  static String id = "";
  static Future<void> addItem(
      category, item_name, maker, model_number, supplier) async {
    final db = FirebaseFirestore.instance;

    final item = <String, dynamic>{
      "category": category,
      "item_name": item_name,
      "maker": maker,
      "model_number": model_number,
      "registered_date": FieldValue.serverTimestamp(),
      "supplier": supplier,
    };

    // Add a new document with a generated ID
    await db
        .collection("items")
        .add(item)
        .then((DocumentReference doc) => id = doc.id);
    debugPrint(id);
  }
}

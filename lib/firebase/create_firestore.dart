import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateFireStore {
  static String itemId = "";
  static String lendingId = "";
  static Future<void> addItem(
      category, item_name, maker, model_number, supplier) async {
    final db = FirebaseFirestore.instance;

    final item = <String, dynamic>{
      "category": category,
      "is_lending": false,
      "item_name": item_name,
      "lending_log_id": "",
      "maker": maker,
      "model_number": model_number,
      "registered_date": FieldValue.serverTimestamp(),
      "supplier": supplier,
    };

    // Add a new document with a generated ID
    await db
        .collection("items")
        .add(item)
        .then((DocumentReference doc) => itemId = doc.id);
  }

  static Future<void> addLendingLogs(comments, item_id, name) async {
    final db = FirebaseFirestore.instance;
    final lendingLog = <String, dynamic>{
      "comments": comments,
      "item_id": item_id,
      "lending_date": FieldValue.serverTimestamp(),
      "name": name,
    };

    // // Add a new document with a generated ID
    await db
        .collection("lending_logs")
        .add(lendingLog)
        .then((DocumentReference doc) => lendingId = doc.id);
  }
}

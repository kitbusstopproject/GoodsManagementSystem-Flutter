import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SetFireStore {
  
  static Future<void> setLending(String itemId) async {
    final db = FirebaseFirestore.instance;
    await db.collection("items").doc(itemId).set({"isLending": true});
  }
}

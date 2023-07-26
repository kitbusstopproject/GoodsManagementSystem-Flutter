import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/firebase/updateFireStore.dart';
import 'package:goodsmanagementsystem/view/returning_result.dart';
import 'package:nfc_manager/nfc_manager.dart';

class ReturningNfc extends StatefulWidget {
  const ReturningNfc({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReturningNfcState createState() => _ReturningNfcState();
}

class _ReturningNfcState extends State<ReturningNfc> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  List<DocumentSnapshot> categoryList = [];

  @override
  void initState() {
    super.initState();
    _tagRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("返却"),
      ),
      body: const Center(child: Text("返却画面")),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      String item_id = "";
      result.value = tag.data;
      // Fluttertoast.showToast(msg: tag.data.toString());

      try {
        List<int> tagData =
            tag.data["ndef"]["cachedMessage"]["records"][0]["payload"];
        for (int i = 3; i < tagData.length; i++) {
          item_id += String.fromCharCode(tagData[i]);
        }
        // try/catch意味なかった
      } catch (e) {
        // Fluttertoast.showToast(msg: e.toString());
        debugPrint("未登録のタグ");
      }
      UpdateFireStore.updateReturningItem(item_id);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ReturnigResult()));
    });
  }
}

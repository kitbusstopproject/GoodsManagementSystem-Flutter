import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/firebase/getFireStore.dart';
import 'package:goodsmanagementsystem/firebase/setFireStore.dart';
import 'package:goodsmanagementsystem/view/lendhing_nfc_input.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LendingNfc extends StatefulWidget {
  const LendingNfc({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LendingNfcState createState() => _LendingNfcState();
}

class _LendingNfcState extends State<LendingNfc> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  List<DocumentSnapshot> categoryList = [];

  @override
  void initState() {
    super.initState();
    _tagRead();
  }

  @override
  Widget build(BuildContext context) {
    final lendItem = GetFireStore.getItem('101aIjX0awmHOdmaG8tX');
    lendItem.then((value) {
      debugPrint(value["isLending"].toString());
      value["isLending"] = true;
      value["lending_log_id"] = "";
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("貸出"),
      ),
      body: const Center(child: Text("貸出画面")),

      // body: FloatingActionButton(onPressed: () {
      //   // SetFireStore.setLending("bws4ug9n2O12ExJxpTan");
      //   // GetFireStore.getItem("101aIjX0awmHOdmaG8tX");
      // })
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

      debugPrint(item_id);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LendingNfcInput(item_id: item_id)));
    });
  }
}
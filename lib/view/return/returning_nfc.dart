// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/firebase/check_registered.dart';
import 'package:goodsmanagementsystem/firebase/get_firestore.dart';
import 'package:goodsmanagementsystem/firebase/update_firestore.dart';
import 'package:goodsmanagementsystem/utils/slack_control.dart';
import 'package:goodsmanagementsystem/view/lend/no_lending.dart';
import 'package:goodsmanagementsystem/view/no_registered.dart';
import 'package:goodsmanagementsystem/view/return/returning_result.dart';
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
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 200,
            child: Image.asset('images/notty.jpg'),
          ),
          const SizedBox(height: 20),
          const Text("使い終わった機材のNFCをタッチしてください")
        ]),
      ),
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

      // itemが登録されているか
      if (await CheckRegistered.checkExist(item_id)) {
        final item = await GetFireStore.getItem(item_id);
        final lendingLog =
            await GetFireStore.getLendingLog(item['lending_log_id']);
        if (item["is_lending"]) {
          SlackControl.returnInformationSend(lendingLog['name'], item['item_name']);
          UpdateFireStore.updateReturningItem(item_id);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReturnigResult()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NoLending()));
        }
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NoRegistered()));
      }
    });
  }
}

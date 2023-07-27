// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/firebase/check_registered.dart';
import 'package:goodsmanagementsystem/view/lend/lending_nfc_input.dart';
import 'package:goodsmanagementsystem/view/no_registered.dart';
import 'package:nfc_manager/nfc_manager.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text("貸出"),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 200,
              child: Image.asset('images/notty.jpg'),
            ),
            const SizedBox(height: 20),
            const Text("使いたい機材のNFCをタッチしてください")
          ]),
        ));
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
      if (await CheckRegistered.checkExist(item_id)) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LendingNfcInput(item_id: item_id)));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NoRegistered()));
      }
    });
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nfc_manager/nfc_manager.dart';

class SignUpNfc extends StatefulWidget {
  final goodsId;
  final goodsName;
  final makerName;
  final modelNumber;
  final supplier;
  final category;

  const SignUpNfc(
      {Key? key,
      required this.goodsId,
      required this.goodsName,
      required this.makerName,
      required this.modelNumber,
      required this.supplier,
      required this.category})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpNfcState createState() => _SignUpNfcState();
}

class _SignUpNfcState extends State<SignUpNfc> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  


  @override
  void initState() {
    super.initState();
    _ndefWrite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("新規登録"),
        ),
        body: Text(widget.goodsId));
  }

  void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        // タグが空だけど、書き込みフラグが立っていなかった場合
        // NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        // id書き込みを行っている
        NdefRecord.createText(widget.goodsId),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        // NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        // NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
      Fluttertoast.showToast(msg: result.value);
    });
  }
}

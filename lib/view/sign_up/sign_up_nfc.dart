// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/view/sign_up/sign_up_result.dart';
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
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 200,
            child: Image.asset('images/notty.jpg'),
          ),
          const SizedBox(height: 20),
          Text("物品名:" + widget.goodsName),
          Text("メーカー:" + widget.makerName),
          Text("型番:" + widget.modelNumber),
          Text("購入元:" + widget.supplier),
          const SizedBox(height: 20),
          const Text("登録したいNFCをタッチしてください\n既に登録されているタグは上書きしちゃうゾ")
        ]),
      ),
    );
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUpResult(
                    goodsName: widget.goodsName,
                    makerName: widget.makerName,
                    modelNumber: widget.modelNumber,
                    supplier: widget.supplier,
                    category: widget.category,
                  )));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goodsmanagementsystem/firebase/updateFireStore.dart';

import '../firebase/createFireStore.dart';

class LendingNfcInput extends StatefulWidget {
  final item_id;
  const LendingNfcInput({
    Key? key,
    required this.item_id,
  }) : super(key: key);

  @override
  State<LendingNfcInput> createState() => _LendingNfcInputState();
}

class _LendingNfcInputState extends State<LendingNfcInput> {


  var commentsController = TextEditingController();
  var nameController = TextEditingController();

  static var comments = "";
  static var name = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("貸出登録")),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: commentsController,
                decoration: const InputDecoration(
                  labelText: 'コメント',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '名前',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                  onPressed: lendingButtonOnPressed(comments, name, widget.item_id),
                  // onPressed: () async {
                  //   comments = commentsController.text;
                  //   name = nameController.text;
                  //   await CreateFireStore.addLendingLogs(
                  //       comments, item_id, name);
                  //   await CreateFireStore.addItem(
                  //       category, item_name, maker, model_number, supplier);
                  //   Fluttertoast.showToast(msg: "貸出完了");

                  //   // ignore: use_build_context_synchronously
                  //   // Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //       builder: (context) => SignUpNfc(
                  //   //             goodsId: CreateFireStore.id,
                  //   //             goodsName: goodsName,
                  //   //             makerName: makerName,
                  //   //             modelNumber: modelNumber,
                  //   //             supplier: supplier,
                  //   //             category: isSelectedItem,
                  //   //           )),
                  //   // );
                  // },
                  child: const Text('情報登録')),
            ],
          )),
    );
  }

  lendingButtonOnPressed(comments, name, item_id) async {
    CreateFireStore.addLendingLogs(comments, item_id, name);
    UpdateFireStore.updateLendingItem(item_id, CreateFireStore.lendingId);
  }
}

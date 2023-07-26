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
                  onPressed: () {
                    CreateFireStore.addLendingLogs(commentsController.text,
                        widget.item_id, nameController.text);
                    UpdateFireStore.updateLendingItem(
                        widget.item_id, CreateFireStore.lendingId);
                    debugPrint(widget.item_id);
                  },
                  child: const Text('情報登録')),
            ],
          )),
    );
  }
}

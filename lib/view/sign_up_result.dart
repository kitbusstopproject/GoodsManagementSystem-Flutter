// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SignUpResult extends StatelessWidget {
  final goodsName;
  final makerName;
  final modelNumber;
  final supplier;
  final category;
  const SignUpResult(
      {super.key,
      required this.goodsName,
      required this.makerName,
      required this.modelNumber,
      required this.supplier,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("貸出"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "新規登録が完了しました。\nご利用ありがとうございました。",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(children: [
              const Text("登録情報"),
              Text("物品名：$goodsName"),
              Text("メーカー：$makerName"),
              Text("型番:$modelNumber"),
              Text("購入元：$supplier"),
              Text("カテゴリ：$category"),
            ]),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Topに戻る"))
        ],
      )),
    );
  }
}

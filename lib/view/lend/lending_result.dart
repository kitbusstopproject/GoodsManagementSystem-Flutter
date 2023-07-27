import 'package:flutter/material.dart';

class LendingResult extends StatelessWidget {
  const LendingResult({super.key});

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
            "貸出が完了しました。\nご利用ありがとうございました。",
            textAlign: TextAlign.center,
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

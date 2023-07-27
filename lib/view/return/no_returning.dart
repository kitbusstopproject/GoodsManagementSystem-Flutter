import 'package:flutter/material.dart';

class NoReturning extends StatelessWidget {
  const NoReturning({super.key});

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
            "返却されていません\n先に返却処理をしてください",
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

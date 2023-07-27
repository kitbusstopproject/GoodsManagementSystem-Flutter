import 'package:flutter/material.dart';

class NoRegistered extends StatelessWidget {
  const NoRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登録なし"),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 200,
            child: Image.asset('images/notty.jpg'),
          ),
          const SizedBox(height: 20),
          const Text("NFCが登録されていません"),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Topに戻る"))
        ]),
      ),
    );
  }
}

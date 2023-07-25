import 'package:flutter/material.dart';

class ReturningNfc extends StatelessWidget {
  const ReturningNfc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("返却"),
        ),
        body: const Text("返却画面"));
  }
}

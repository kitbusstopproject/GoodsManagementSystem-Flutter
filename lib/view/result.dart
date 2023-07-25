import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final dynamic value;
  const Result({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("結果"),
        ),
        body: Text(value));
  }
}

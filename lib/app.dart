import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/view/mainpage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("物品管理アプリ"),
      ),
      body: const Mainpage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/view/mainpage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset('images/notty.jpg'),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text("物品管理しちゃおっかなー")
          ],
        ),
      ),
      body: const Mainpage(),
    );
  }
}

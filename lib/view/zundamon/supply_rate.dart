import 'package:flutter/material.dart';

class SupplyRate extends StatelessWidget {
  const SupplyRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
              height: 50, child: Image.asset("images/zunmon_logo.png")),
        ),
        body: const Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(title: Text("初見はかえれなのだ"), trailing: Text("2%")),
          ListTile(title: Text("仕事しろ"), trailing: Text("2%")),
          ListTile(title: Text("HAYOYARE"), trailing: Text("2%")),
          ListTile(title: Text("吉"), trailing: Text("26%")),
          ListTile(title: Text("大吉"), trailing: Text("22%")),
          ListTile(title: Text("末吉"), trailing: Text("14%")),
          ListTile(title: Text("小吉"), trailing: Text("12%")),
          ListTile(title: Text("凶"), trailing: Text("12%")),
          ListTile(title: Text("中吉"), trailing: Text("8%")),
        ])));
  }
}

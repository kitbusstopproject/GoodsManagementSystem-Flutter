import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/components/action_card.dart';
import 'package:goodsmanagementsystem/view/lending_nfc.dart';
import 'package:goodsmanagementsystem/view/returning_nfc.dart';
import 'package:goodsmanagementsystem/view/sign_up_nfc_input.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                child: const ActionCard(actionName: "新規登録"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpNfcInput()),
                  );
                }),
            const SizedBox(height: 20),
            GestureDetector(
                child: const ActionCard(actionName: "貸出"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LendingNfc()),
                  );
                }),
            const SizedBox(height: 20),
            GestureDetector(
                child: const ActionCard(actionName: "返却"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReturningNfc()),
                  );
                }),
          ],
        )));
  }
}
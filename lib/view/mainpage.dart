// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/audio/zunmon_audio_controller.dart';
import 'package:goodsmanagementsystem/view/lend/lending_nfc.dart';
import 'package:goodsmanagementsystem/view/return/returning_nfc.dart';
import 'package:goodsmanagementsystem/view/sign_up/sign_up_nfc_input.dart';
import 'package:goodsmanagementsystem/view/zundamon/zundamon.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
      debugPrint(_counter.toString());
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
      debugPrint(_counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpNfcInput()),
                    );
                  },
                  child: const SizedBox(
                      height: 100, child: Center(child: Text('新規登録'))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LendingNfc()),
                    );
                  },
                  child: const SizedBox(
                      height: 100, child: Center(child: Text('貸出'))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReturningNfc()),
                    );
                  },
                  child: const SizedBox(
                      height: 100, child: Center(child: Text('返却'))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                  child: Opacity(
                      opacity: _counter / 10,
                      child: Image.asset("images/zunmon.png")),
                  onTap: () async {
                    if (_counter < 9) {
                      incrementCounter();
                      debugPrint(_counter.toString());
                    } else {
                      resetCounter();
                      ZunmonAudioController.setupSession();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Zundamon()),
                      );
                      await ZunmonAudioController.playSoundFile();
                    }
                  }),
            )
          ],
        )));
  }
}

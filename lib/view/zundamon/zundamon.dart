// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:goodsmanagementsystem/audio/zunmon_audio_controller.dart';
import 'package:goodsmanagementsystem/view/zundamon/supply_rate.dart';

class Zundamon extends StatefulWidget {
  const Zundamon({super.key});

  @override
  State<Zundamon> createState() => _ZundamonState();
}

class _ZundamonState extends State<Zundamon> {
  var random = math.Random();

  final List<String> zunmonList = [
    "images/zunmon002.png",
    "images/zunmon003.png",
    "images/zunmon004.png",
    "images/zunmon005.png",
    "images/zunmon006.png",
    "images/zunmon007.png",
    "images/zunmon009.png",
    "images/zunmon010.png",
    "images/zunmon011.png",
    "images/zunmon012.png",
    "images/zunmon013.png",
    "images/zunmon014.png",
    "images/zunmon015.png",
    "images/zunmon016.png",
    "images/zunmon017.png",
    "images/zunmon018.png",
    "images/zunmon019.png",
    "images/zunmon020.png",
    "images/zunmon021.png",
    "images/zunmon022.png",
    "images/zunmon023.png",
    "images/zunmon024.png",
    "images/zunmon025.png",
    "images/zunmon026.png",
  ];

  @override
  void dispose() {
    ZunmonAudioController.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
              height: 50, child: Image.asset("images/zunmon_logo.png")),
        ),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(zunmonList[random.nextInt(24)]),
          const Text("©VOICEVOX:ずんだもん"),
          FilledButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupplyRate()));
              },
              child: const Text("提供割合"))
        ])));
  }
}

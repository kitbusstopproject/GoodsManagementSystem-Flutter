library slack.api;

import 'package:slack_notifier/slack_notifier.dart';
import "dart:async";
import "dart:convert";
import "dart:io";
import "package:flutter/cupertino.dart";
import "package:fluttertoast/fluttertoast.dart";

class SlackControl {
  static lendingInformationSend() {
    Fluttertoast.showToast(msg: "slack Send!");
    final slack =
        SlackNotifier('<webhookLink>');
    debugPrint('slack Send');
    slack.send(
      '物品の貸し出しがありました',
      channel: 'flutterアプリテストチャンネル',
      iconEmoji: ':chart_with_upwards_trend:',
      iconUrl: 'https://picsum.photos/48/48',
      username: 'My Bot',
      blocks: [SectionBlock(text: '物品の貸し出しがありました')],
      // attachments: [Attachment(pretext: '○○さん', text: '物品名')],
    );
  }
}
library slack.api;

import 'package:slack_notifier/slack_notifier.dart';
import "package:flutter/cupertino.dart";
import "package:fluttertoast/fluttertoast.dart";
import "env.dart";

class SlackControl {
  static lendingInformationSend(String name, String item) {
    final slack = SlackNotifier(webHookUrl);
    slack.send(
      '物品の貸し出しがありました',
      channel: 'flutterアプリテストチャンネル',
      iconEmoji: ':chart_with_upwards_trend:',
      iconUrl: 'https://picsum.photos/48/48',
      username: 'My Bot',
      blocks: [SectionBlock(text: '物品の貸し出しがありました:zundamon:')],
      attachments: [Attachment(pretext: '$nameさん', text: '物品名:$item')],
    );
  }

  static returnInformationSend(String lenderName, String item) {
    final slack = SlackNotifier(webHookUrl);
    slack.send(
      '貸し出されていた物品が返却されました',
      channel: 'flutterアプリテストチャンネル',
      iconEmoji: ':chart_with_upwards_trend:',
      iconUrl: 'https://picsum.photos/48/48',
      username: 'My Bot',
      blocks: [SectionBlock(text: '貸し出されていた物品が返却されました')],
      attachments: [Attachment(pretext: '$lenderNameさん', text: '物品名:$item')],
    );
  }
}

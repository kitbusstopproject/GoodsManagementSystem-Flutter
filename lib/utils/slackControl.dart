library slack.api;

import 'package:slack_notifier/slack_notifier.dart';
import "package:flutter/cupertino.dart";
import "package:fluttertoast/fluttertoast.dart";
import "env.dart";

class SlackControl {
  static lendingInformationSend(String name, String item) {
    final slack =
        SlackNotifier(webHookUrl);
    debugPrint('slack Send');
    slack.send(
      '物品の貸し出しがありました',
      channel: 'flutterアプリテストチャンネル',
      iconEmoji: ':chart_with_upwards_trend:',
      iconUrl: 'https://picsum.photos/48/48',
      username: 'My Bot',
      blocks: [SectionBlock(text: '物品の貸し出しがありました')],
      attachments: [Attachment(pretext: '$nameさん', text: '物品名:$item')],
    );
  }
}

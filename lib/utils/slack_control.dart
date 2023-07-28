library slack.api;

import 'package:slack_notifier/slack_notifier.dart';
import "env.dart";

class SlackControl {
  static lendingInformationSend(
      String comment, String name, String item, bool zundaFlag) {
    final slack = SlackNotifier(webHookUrl);
    final zundaStamp = zundaFlag ? ':zundamon:' : '';
    slack.send(
      '物品の貸し出しがありました',
      channel: 'flutterアプリテストチャンネル',
      iconEmoji: ':chart_with_upwards_trend:',
      iconUrl: 'https://picsum.photos/48/48',
      username: 'My Bot',
      blocks: [
        SectionBlock(text: '''
物品の貸し出しがありました
物品名：$item
貸出者：$nameさん

コメント''')
      ],
      attachments: [Attachment( text: '$comment $zundaStamp')],
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
      blocks: [SectionBlock(text: '''
貸し出されていた物品が返却されました
物品名：$item
貸出者：$lenderNameさん''')],

    );
  }
}

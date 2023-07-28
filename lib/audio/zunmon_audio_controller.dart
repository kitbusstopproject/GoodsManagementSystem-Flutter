import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'dart:math' as math;

class ZunmonAudioController {
  static late AudioPlayer player;
  static List<String> voiceList = [
    'assets/audio/04.wav',
    'assets/audio/05.wav',
    'assets/audio/06.wav',
    'assets/audio/chukichi.wav',
    'assets/audio/chukichi.wav',
    'assets/audio/chukichi.wav',
    'assets/audio/chukichi.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/dai.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kichi.wav',
    'assets/audio/kyou.wav',
    'assets/audio/kyou.wav',
    'assets/audio/kyou.wav',
    'assets/audio/kyou.wav',
    'assets/audio/kyou.wav',
    'assets/audio/kyou.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/suekichi.wav',
    'assets/audio/syoukichi.wav',
    'assets/audio/syoukichi.wav',
    'assets/audio/syoukichi.wav',
    'assets/audio/syoukichi.wav',
    'assets/audio/syoukichi.wav',
    'assets/audio/syoukichi.wav',
  ];

  static Future<void> setupSession() async {
    player = AudioPlayer();
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    await _loadAudioFile();
  }

  static Future<void> playSoundFile() async {
    if (player.processingState == ProcessingState.completed) {
      await _loadAudioFile();
    }

    await player.setSpeed(1.0);
    await player.play();
  }

  static Future<void> _loadAudioFile() async {
    var random = math.Random();
    try {
      await player.setAsset(voiceList[random.nextInt(50)]);
    } catch (e) {
      print(e);
    }
  }
}

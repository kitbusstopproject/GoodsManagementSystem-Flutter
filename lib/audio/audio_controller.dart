import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'dart:math' as math;

class AudioController {
  static late AudioPlayer player;
  static List<String> voiceList = [
    'assets/audio/01.wav',
    'assets/audio/02.wav',
    'assets/audio/03.wav'
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
      await player.setAsset(voiceList[random.nextInt(3)]);
    } catch (e) {
      print(e);
    }
  }
}

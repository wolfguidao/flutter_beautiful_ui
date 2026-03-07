import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  static final AudioPlayerService _instance = AudioPlayerService._internal();
  factory AudioPlayerService() => _instance;
  AudioPlayerService._internal();

  final AudioPlayer _player = AudioPlayer();
  String? _currentTrackName;

  AudioPlayer get player => _player;
  String? get currentTrackName => _currentTrackName;

  // 直接播放URL
  Future<void> playUrl(String url, {String? trackName}) async {
    try {
      _currentTrackName = trackName;
      await _player.setUrl(url);
      await _player.play();
    } catch (e) {
      throw Exception('播放失败: $e');
    }
  }

  // 暂停
  Future<void> pause() async {
    await _player.pause();
  }

  // 继续播放
  Future<void> resume() async {
    await _player.play();
  }

  // 停止
  Future<void> stop() async {
    await _player.stop();
    _currentTrackName = null;
  }

  // 跳转到指定位置
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  // 设置音量 (0.0 - 1.0)
  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  // 释放资源
  void dispose() {
    _player.dispose();
  }
}

class NeteaseTrack {
  final int id;
  final String name;
  final List<String> artists;
  final String? albumName;
  final String? albumPicUrl;
  final int duration;
  String? playUrl;

  NeteaseTrack({
    required this.id,
    required this.name,
    required this.artists,
    this.albumName,
    this.albumPicUrl,
    required this.duration,
    this.playUrl,
  });

  factory NeteaseTrack.fromJson(Map<String, dynamic> json) {
    // 解析艺术家列表
    List<String> artistNames = [];
    if (json['artists'] != null) {
      artistNames = (json['artists'] as List)
          .map((artist) => artist['name'] as String)
          .toList();
    } else if (json['ar'] != null) {
      artistNames = (json['ar'] as List)
          .map((artist) => artist['name'] as String)
          .toList();
    }

    // 解析专辑信息
    String? albumName;
    String? albumPicUrl;
    if (json['album'] != null) {
      albumName = json['album']['name'];
      albumPicUrl = json['album']['picUrl'];
    } else if (json['al'] != null) {
      albumName = json['al']['name'];
      albumPicUrl = json['al']['picUrl'];
    }

    return NeteaseTrack(
      id: json['id'],
      name: json['name'] ?? 'Unknown Track',
      artists: artistNames,
      albumName: albumName,
      albumPicUrl: albumPicUrl,
      duration: json['duration'] ?? json['dt'] ?? 0,
    );
  }

  String get artistsString => artists.join(', ');

  String get durationString {
    final seconds = duration ~/ 1000;
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

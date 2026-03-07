// 歌单模型
class NeteasePlaylist {
  final int id;
  final String name;
  final String? coverImgUrl;
  final String? description;
  final int trackCount;
  final int playCount;
  final String? creator;

  NeteasePlaylist({
    required this.id,
    required this.name,
    this.coverImgUrl,
    this.description,
    required this.trackCount,
    required this.playCount,
    this.creator,
  });

  factory NeteasePlaylist.fromJson(Map<String, dynamic> json) {
    return NeteasePlaylist(
      id: json['id'],
      name: json['name'] ?? 'Unknown Playlist',
      coverImgUrl: json['coverImgUrl'],
      description: json['description'],
      trackCount: json['trackCount'] ?? 0,
      playCount: json['playCount'] ?? 0,
      creator: json['creator']?['nickname'],
    );
  }

  String get playCountString {
    if (playCount >= 100000000) {
      return '${(playCount / 100000000).toStringAsFixed(1)}亿';
    } else if (playCount >= 10000) {
      return '${(playCount / 10000).toStringAsFixed(1)}万';
    }
    return playCount.toString();
  }
}
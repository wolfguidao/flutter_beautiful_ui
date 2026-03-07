// 歌单标签模型
class PlaylistTag {
  final int id;
  final String name;
  final int type;
  final int category;
  final bool hot;

  PlaylistTag({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.hot,
  });

  factory PlaylistTag.fromJson(Map<String, dynamic> json) {
    return PlaylistTag(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      type: json['type'] ?? 0,
      category: json['category'] ?? 0,
      hot: json['hot'] ?? false,
    );
  }

  // 获取分类名称
  String get categoryName {
    switch (category) {
      case 0:
        return '语种';
      case 1:
        return '风格';
      case 2:
        return '场景';
      case 3:
        return '情感';
      case 4:
        return '主题';
      default:
        return '其他';
    }
  }
}

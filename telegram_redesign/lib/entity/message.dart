enum MessageType { text, image, file, voice, video, link, mention }

class Message {
  final String id;
  final String senderName;
  final String? senderAvatar;
  final DateTime timestamp;
  final MessageType type;
  final bool isMe;

  /// 文字内容，也可用作媒体文件的说明（Caption）
  final String? text;

  /// 图片、语音、视频或文件的 URL/路径
  final String? mediaUrl;

  /// 视频的缩略图 URL
  final String? thumbnailUrl;

  /// 文件名
  final String? fileName;

  /// 文件大小（如 "2.4 MB"）
  final String? fileSize;

  /// 语音或视频的时长
  final Duration? duration;

  /// 链接地址
  final String? linkUrl;

  /// 被 @ 的用户 ID 或用户名
  final String? mentionedUser;

  Message({
    required this.id,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    required this.type,
    required this.isMe,
    this.text,
    this.mediaUrl,
    this.thumbnailUrl,
    this.fileName,
    this.fileSize,
    this.duration,
    this.linkUrl,
    this.mentionedUser,
  });

  /// 快捷构造：文字消息
  factory Message.text({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String text,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.text,
      isMe: isMe,
      text: text,
    );
  }

  /// 快捷构造：图片消息
  factory Message.image({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String imageUrl,
    String? caption,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.image,
      isMe: isMe,
      mediaUrl: imageUrl,
      text: caption,
    );
  }

  /// 快捷构造：文件消息
  factory Message.file({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String fileUrl,
    required String fileName,
    required String fileSize,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.file,
      isMe: isMe,
      mediaUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
    );
  }

  /// 快捷构造：语音消息
  factory Message.voice({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String voiceUrl,
    required Duration duration,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.voice,
      isMe: isMe,
      mediaUrl: voiceUrl,
      duration: duration,
    );
  }

  /// 快捷构造：视频消息
  factory Message.video({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String videoUrl,
    String? thumbnailUrl,
    required Duration duration,
    String? caption,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.video,
      isMe: isMe,
      mediaUrl: videoUrl,
      thumbnailUrl: thumbnailUrl,
      duration: duration,
      text: caption,
    );
  }

  /// 快捷构造：链接消息
  factory Message.link({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String text,
    required String linkUrl,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.link,
      isMe: isMe,
      text: text,
      linkUrl: linkUrl,
    );
  }

  /// 快捷构造：@提醒消息
  factory Message.mention({
    required String id,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    required bool isMe,
    required String text,
    required String mentionedUser,
  }) {
    return Message(
      id: id,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: timestamp,
      type: MessageType.mention,
      isMe: isMe,
      text: text,
      mentionedUser: mentionedUser,
    );
  }
}

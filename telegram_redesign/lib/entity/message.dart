enum MessageType { text, image, file, voice, video, link, mention }

class Message {
  final String id;
  final String senderId;
  final DateTime timestamp;
  final MessageType type;
  final bool isMe;

  /// 消息主要内容（用于列表预览等）
  /// 文字消息为文字，链接消息为网页名/标题，文件/图片/视频为文件名
  final String content;

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
    required this.senderId,
    required this.timestamp,
    required this.type,
    required this.isMe,
    required this.content,
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
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String text,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.text,
      isMe: isMe,
      content: text,
      text: text,
    );
  }

  /// 快捷构造：图片消息
  factory Message.image({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String imageUrl,
    String? fileName,
    String? caption,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.image,
      isMe: isMe,
      content: fileName ?? imageUrl.split('/').last,
      mediaUrl: imageUrl,
      fileName: fileName ?? imageUrl.split('/').last,
      text: caption,
    );
  }

  /// 快捷构造：文件消息
  factory Message.file({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String fileUrl,
    required String fileName,
    required String fileSize,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.file,
      isMe: isMe,
      content: fileName,
      mediaUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
    );
  }

  /// 快捷构造：语音消息
  factory Message.voice({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String voiceUrl,
    required Duration duration,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.voice,
      isMe: isMe,
      content: voiceUrl.split('/').last,
      mediaUrl: voiceUrl,
      fileName: voiceUrl.split('/').last,
      duration: duration,
    );
  }

  /// 快捷构造：视频消息
  factory Message.video({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String videoUrl,
    String? thumbnailUrl,
    String? fileName,
    required Duration duration,
    String? caption,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.video,
      isMe: isMe,
      content: fileName ?? videoUrl.split('/').last,
      mediaUrl: videoUrl,
      thumbnailUrl: thumbnailUrl,
      fileName: fileName ?? videoUrl.split('/').last,
      duration: duration,
      text: caption,
    );
  }

  /// 快捷构造：链接消息
  factory Message.link({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String text,
    required String linkUrl,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.link,
      isMe: isMe,
      content: text,
      text: text,
      linkUrl: linkUrl,
    );
  }

  /// 快捷构造：@提醒消息
  factory Message.mention({
    required String id,
    required String senderId,
    required DateTime timestamp,
    required bool isMe,
    required String text,
    required String mentionedUser,
  }) {
    return Message(
      id: id,
      senderId: senderId,
      timestamp: timestamp,
      type: MessageType.mention,
      isMe: isMe,
      content: text,
      text: text,
      mentionedUser: mentionedUser,
    );
  }
}

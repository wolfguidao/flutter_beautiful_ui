import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/employee.dart';

class Message {
  final Employee sender;
  final DateTime sendTime;
  final MessageType type;

  /// 文本内容 (用于纯文字消息或文件/图片的描述)
  final String? content;

  /// 文件名 (当消息类型为 file 或 image 时使用)
  final String? fileName;

  /// 文件 URL 或 路径
  final String? fileUrl;

  /// 文件大小 (例如 "2.5 MB")
  final String? fileSize;

  Message({
    required this.sender,
    required this.sendTime,
    required this.type,
    this.content,
    this.fileName,
    this.fileUrl,
    this.fileSize,
  });

  /// 快速创建文本消息
  factory Message.text({
    required Employee sender,
    required DateTime sendTime,
    required String content,
  }) {
    return Message(
      sender: sender,
      sendTime: sendTime,
      type: MessageType.text,
      content: content,
    );
  }

  /// 快速创建图片消息
  factory Message.image({
    required Employee sender,
    required DateTime sendTime,
    required String imageUrl,
    String? caption,
  }) {
    return Message(
      sender: sender,
      sendTime: sendTime,
      type: MessageType.image,
      fileUrl: imageUrl,
      content: caption,
    );
  }

  /// 快速创建文件消息
  factory Message.file({
    required Employee sender,
    required DateTime sendTime,
    required String fileName,
    required String fileUrl,
    String? fileSize,
  }) {
    return Message(
      sender: sender,
      sendTime: sendTime,
      type: MessageType.file,
      fileName: fileName,
      fileUrl: fileUrl,
      fileSize: fileSize,
    );
  }
}

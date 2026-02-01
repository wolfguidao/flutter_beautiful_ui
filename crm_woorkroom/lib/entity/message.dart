import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/employee.dart';

class Message {
  final Employee sender;
  final DateTime sendTime;
  final MessageType type;
  final String? content;
  final String? fileName;
  final String? fileUrl;
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

  factory Message.text({
    required Employee sender,
    required DateTime sendTime,
    required String content,
    String? fileName,
    String? fileSize,
  }) {
    return Message(
      sender: sender,
      sendTime: sendTime,
      type: MessageType.text,
      content: content,
      fileName: fileName,
      fileSize: fileSize,
    );
  }

  factory Message.image({
    required Employee sender,
    required DateTime sendTime,
    required String imageUrl,
    String? fileName,
    String? fileSize,
    String? caption,
  }) {
    return Message(
      sender: sender,
      sendTime: sendTime,
      type: MessageType.image,
      fileUrl: imageUrl,
      fileName: fileName,
      fileSize: fileSize,
      content: caption,
    );
  }

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

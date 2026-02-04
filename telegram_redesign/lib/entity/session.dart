import 'message.dart';

enum SessionStatus { active, inactive, isVideo, isCalling }

class Session {
  final String id;
  final String name;
  final String avatar;
  final SessionStatus status;
  final bool isPinned;
  final int unreadCount;
  final Message? latestMessage;

  Session({
    required this.id,
    required this.name,
    required this.avatar,
    required this.status,
    required this.isPinned,
    required this.unreadCount,
    this.latestMessage,
  });
}

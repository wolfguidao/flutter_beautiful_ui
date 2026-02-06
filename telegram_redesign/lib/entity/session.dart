import 'message.dart';
import 'user.dart';

enum SessionStatus { active, inactive, isVideo, isCalling }

enum SessionType { private, group, channel }

class Session {
  final String id;
  final String name;
  final String avatar;
  final SessionStatus status;
  final SessionType type;
  final bool isPinned;
  final int unreadCount;
  final Message? latestMessage;
  final List<User> members;

  Session({
    required this.id,
    required this.name,
    required this.avatar,
    required this.status,
    required this.type,
    required this.isPinned,
    required this.unreadCount,
    this.latestMessage,
    this.members = const [],
  });
}

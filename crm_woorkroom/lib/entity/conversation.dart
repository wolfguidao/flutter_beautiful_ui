import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/entity/message.dart';

class Conversation {
  final int id;
  final String name;
  final String avatar;
  final SessionType sessionType;
  final List<Employee> members;
  final Message latestMessage;
  final int unread;

  Conversation({
    required this.name,
    required this.avatar,
    required this.sessionType,
    required this.members,
    required this.latestMessage,
    required this.id,
    required this.unread,
  });
}

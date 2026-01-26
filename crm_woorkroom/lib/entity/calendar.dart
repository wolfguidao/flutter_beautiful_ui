import 'package:crm_woorkroom/constant/app_enum.dart';

class Calendar {
  final String title;
  final String spentTime;
  final DateTime createTime;
  final Priority priority;

  Calendar({
    required this.title,
    required this.priority,
    required this.spentTime,
    required this.createTime,
  });
}

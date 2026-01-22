import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/user.dart';

class Task {
  final String name;
  final String estimate;
  final String spentTime;
  final Priority priority;
  final TaskStatus taskStatus;
  final List<User> assignee;
  final TaskType taskType;
  final double progress;

  Task({
    required this.estimate,
    required this.spentTime,
    required this.priority,
    required this.taskStatus,
    required this.assignee,
    required this.taskType,
    required this.name,
    required this.progress,
  });
}

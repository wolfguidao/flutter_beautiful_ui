import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/user.dart';

class Task {
  String id;
  String name;
  String estimate;
  String spentTime;
  Priority priority;
  TaskStatus taskStatus;
  List<User> assignee;
  TaskType taskType;
  double progress;

  Task({
    required this.estimate,
    required this.spentTime,
    required this.priority,
    required this.taskStatus,
    required this.assignee,
    required this.taskType,
    required this.name,
    required this.progress,
    required this.id,
  });
}

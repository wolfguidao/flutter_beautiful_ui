import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/user.dart';

class Task {
  String id;
  String name;
  DateTime createTime;
  int estimateTime;
  int spentTime;
  Priority priority;
  TaskStatus taskStatus;
  TaskGroup taskGroup;
  User reporter;
  User assignee;
  TaskType taskType;
  double progress;

  Task({
    required this.createTime,
    required this.estimateTime,
    required this.spentTime,
    required this.priority,
    required this.taskStatus,
    required this.assignee,
    required this.taskType,
    required this.name,
    required this.progress,
    required this.id,
    required this.taskGroup,
    required this.reporter,
  });

  DateTime get deadline => createTime.add(Duration(hours: estimateTime));
}

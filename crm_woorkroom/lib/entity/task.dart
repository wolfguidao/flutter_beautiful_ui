import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/activity.dart';
import 'package:crm_woorkroom/entity/file.dart';
import 'package:crm_woorkroom/entity/employee.dart';

class Task {
  String id;
  String name;
  String description;
  DateTime createTime;
  int estimateTime;
  int spentTime;
  Priority priority;
  TaskStatus taskStatus;
  TaskGroup taskGroup;
  Employee reporter;
  Employee assignee;
  TaskType taskType;
  double progress;
  List<Activity> activityList;
  List<TaskFile> attachments;

  Task({
    required this.attachments,
    required this.activityList,
    required this.description,
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

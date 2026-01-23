import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/task.dart';

class Project {
  String id;
  String name;
  String icon;
  String createTime;
  Priority priority;
  List<Task> tasks;

  Project({
    required this.id,
    required this.name,
    required this.icon,
    required this.createTime,
    required this.priority, required this.tasks,
  });
}
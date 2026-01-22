import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/task.dart';

class Project {
  final String id;
  final String name;
  final String icon;
  final String createTime;
  final Priority priority;
  final List<Task> tasks;

  Project({
    required this.id,
    required this.name,
    required this.icon,
    required this.createTime,
    required this.priority, required this.tasks,
  });
}
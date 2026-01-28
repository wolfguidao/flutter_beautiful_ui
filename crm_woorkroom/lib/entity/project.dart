import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/entity/user.dart';

class Project {
  String id;
  String name;
  String icon;
  String createTime;
  String deadline;
  String description;
  Employee reporter;
  Priority priority;
  List<Task> tasks;

  Project({
    required this.id,
    required this.name,
    required this.icon,
    required this.createTime,
    required this.deadline,
    required this.description,
    required this.reporter,
    required this.priority,
    required this.tasks,
  });

  List<Employee> get allAssignee {
    Set<Employee> assigness = {};
    for (Task task in tasks) {
      assigness.add(task.assignee);
    }
    return assigness.toList();
  }

  List<Employee> get allReporter {
    Set<Employee> reporters = {};
    for (Task task in tasks) {
      reporters.add(task.reporter);
    }
    return reporters.toList();
  }

  double get averageProgress {
    if (tasks.isEmpty) return 1.0;
    double totalProgress=0.0;
    for (Task task in tasks) {
      totalProgress+=task.progress;
    }
    return totalProgress/tasks.length;
  }
}

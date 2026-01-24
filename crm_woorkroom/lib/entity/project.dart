// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/entity/user.dart';

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
    required this.priority,
    required this.tasks,
  });

  List<User> get allAssignee{
    Set<User> assigness={};
    for(Task task in tasks){
      assigness.add(task.assignee);
    }
    return assigness.toList();
  }

    List<User> get allReporter{
    Set<User> reporters={};
    for(Task task in tasks){
      reporters.add(task.reporter);
    }
    return reporters.toList();
  }

}

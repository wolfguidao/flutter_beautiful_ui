import 'dart:ui';

class Project {
  final String id;
  final String name;
  final String icon;
  final String createTime;
  final String estimate;
  final String spentTime;
  final ProjectPriority priority;
  final ProjectStatus projectStatus;
  final int taskTotal;
  final int taskActive;
  final int assigneeNumber;

  Project({
    required this.id,
    required this.name,
    required this.icon,
    required this.createTime,
    required this.taskTotal,
    required this.taskActive,
    required this.assigneeNumber,
    required this.estimate,
    required this.spentTime,
    required this.priority,
    required this.projectStatus,
  });
}

enum ProjectPriority {
  low(text: "Low", color: Color(0xff0AC947)),
  medium(text: "Medium", color: Color(0xffFFBD21)),
  high(text: "High", color: Color(0xffDE92EB));

  final String text;
  final Color color;

  const ProjectPriority({required this.text, required this.color});
}

enum ProjectStatus {
  done(
    text: "Done",
    color: Color(0xff00D097),
    backgroundColor: Color(0xffE0F9F2),
  ),
  progress(
    text: "In Progress",
    color: Color(0xff3F8CFF),
    backgroundColor: Color(0xffE8F1FF),
  ),
  review(
    text: "In Review",
    color: Color(0xffC419E6),
    backgroundColor: Color(0xffF9E6FC),
  ),
  todo(
    text: "To Do",
    color: Color(0xff7D8592),
    backgroundColor: Color(0xffEDEEF0),
  );

  final String text;
  final Color color;
  final Color backgroundColor;

  const ProjectStatus({
    required this.text,
    required this.color,
    required this.backgroundColor,
  });
}

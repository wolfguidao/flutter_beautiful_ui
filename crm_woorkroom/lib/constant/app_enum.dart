import 'dart:ui';

enum Priority {
  low(text: "Low", color: Color(0xff0AC947)),
  medium(text: "Medium", color: Color(0xffFFBD21)),
  high(text: "High", color: Color(0xffDE92EB));

  final String text;
  final Color color;

  const Priority({required this.text, required this.color});
}

enum EventLever {
  low(text: "Low", color: Color(0xff0AC947)),
  medium(text: "Medium", color: Color(0xffFFBD21)),
  high(text: "High", color: Color(0xffDE92EB));

  final String text;
  final Color color;

  const EventLever({required this.text, required this.color});
}

enum TaskStatus {
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

  const TaskStatus({
    required this.text,
    required this.color,
    required this.backgroundColor,
  });
}

enum TaskType{
  active,
  backlog
}
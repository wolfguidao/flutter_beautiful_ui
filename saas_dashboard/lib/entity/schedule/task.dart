import 'package:flutter/material.dart';

class Task {
  final String name;
  final String detail;
  final String icon;
  final Color iconBackgroundColor;
  final String image;
  final String startDate;
  final String endDate;
  final int member;
  final TaskStatus status;
  final TaskLever lever;
  final int commentNum;
  final int likeNum;

  Task({
    required this.name,
    required this.icon,
    required this.startDate,
    required this.endDate,
    required this.member,
    required this.status,
    required this.iconBackgroundColor,
    required this.detail,
    required this.lever,
    required this.commentNum,
    required this.likeNum,
    required this.image,
  });
}

enum TaskLever {
  low("Low", Color(0xffFF6A77), Colors.white),
  media("Running", Color(0xffFF8F6B), Colors.white),
  high("High", Color(0xff26C0E2), Colors.white);

  final String label;
  final Color backgroundColor;
  final Color textColor;

  const TaskLever(this.label, this.backgroundColor, this.textColor);
}

enum TaskStatus {
  pending("Pending", Color(0xffFF8F6B), Colors.white),
  running("Running", Color(0xff605BFF), Colors.white),
  done("Done", Color(0xff2B9943), Colors.white);

  final String label;
  final Color backgroundColor;
  final Color textColor;

  const TaskStatus(this.label, this.backgroundColor, this.textColor);
}

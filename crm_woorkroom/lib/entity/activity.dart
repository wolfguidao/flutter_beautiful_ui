import 'package:flutter/material.dart';

class Activity {
  final String username;
  final String avatar;
  final String userRole;
  final List<ActivityItem> item;

  Activity({
    required this.username,
    required this.avatar,
    required this.userRole,
    required this.item,
  });
}

class ActivityItem {
  final String content;
  final IconData iconData;
  final Color iconColor;

  ActivityItem({
    required this.content,
    required this.iconData,
    required this.iconColor,
  });
}

import 'package:crm_woorkroom/entity/activity.dart';
import 'package:crm_woorkroom/entity/event.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppMock {
  static List<Event> eventList = [
    Event(
      title: "Presentation of the new department",
      time: "Today | 5:00 PM",
      timeConsume: "4h",
      lever: EventLever.high,
    ),
    Event(
      title: "Anna’s Birthday",
      time: "Today | 6:00 PM",
      timeConsume: "4h",
      lever: EventLever.medium,
    ),
    Event(
      title: "Ray’s Birthday",
      time: "Tomorrow | 2:00 PM",
      timeConsume: "4h",
      lever: EventLever.low,
    ),
  ];

  static List<Project> projectList = [
    Project(
      id: "PN0001245",
      name: "CRM Mobile App",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      taskTotal: 24,
      taskActive: 12,
      assigneeNumber: 3,
      estimate: "120h",
      spentTime: "80h",
      priority: ProjectPriority.high,
      projectStatus: ProjectStatus.progress,
    ),
    Project(
      id: "PN0001241",
      name: "Admin Dashboard",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      taskTotal: 45,
      taskActive: 0,
      assigneeNumber: 5,
      estimate: "200h",
      spentTime: "205h",
      priority: ProjectPriority.medium,
      projectStatus: ProjectStatus.done,
    ),
    Project(
      id: "PN0001242",
      name: "Brand Identity",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      taskTotal: 10,
      taskActive: 8,
      assigneeNumber: 2,
      estimate: "40h",
      spentTime: "5h",
      priority: ProjectPriority.low,
      projectStatus: ProjectStatus.todo,
    ),
    Project(
      id: "PN0001243",
      name: "Website Redesign",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      taskTotal: 30,
      taskActive: 5,
      assigneeNumber: 4,
      estimate: "150h",
      spentTime: "140h",
      priority: ProjectPriority.high,
      projectStatus: ProjectStatus.review,
    ),
    Project(
      id: "PN0001244",
      name: "QA Testing",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      taskTotal: 15,
      taskActive: 15,
      assigneeNumber: 3,
      estimate: "60h",
      spentTime: "0h",
      priority: ProjectPriority.medium,
      projectStatus: ProjectStatus.todo,
    ),
    Project(
      id: "PN00012456",
      name: "API Integration",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      taskTotal: 20,
      taskActive: 2,
      assigneeNumber: 2,
      estimate: "80h",
      spentTime: "75h",
      priority: ProjectPriority.high,
      projectStatus: ProjectStatus.progress,
    ),
  ];

  static List<Activity> activityList = [
    Activity(
      username: "Evan Yates",
      avatar: Assets.images.avatar.path,
      userRole: "Project Manager",
      item: [
        ActivityItem(
          content: "Updated the 'CRM Mobile App' design system",
          iconData: Icons.edit_note_rounded,
          iconColor: const Color(0xff3F8CFF),
        ),
        ActivityItem(
          content: "Assigned 3 new tasks to the development team",
          iconData: Icons.person_add_alt_1_rounded,
          iconColor: const Color(0xff0AC947),
        ),
        ActivityItem(
          content: "Completed the monthly budget review",
          iconData: Icons.check_circle_outline_rounded,
          iconColor: const Color(0xffFF4D4F),
        ),
      ],
    ),
  ];
}

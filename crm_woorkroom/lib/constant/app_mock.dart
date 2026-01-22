import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/activity.dart';
import 'package:crm_woorkroom/entity/event.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/entity/user.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppMock {
  // 用户数据
  static List<User> userList = [
    User(
      "John Smith",
      Assets.images.avatar.path,
      "Frontend Developer",
      "Senior",
    ),
    User(
      "Sarah Johnson",
      Assets.images.avatar.path,
      "Backend Developer",
      "Mid",
    ),
    User("Mike Chen", Assets.images.avatar.path, "UI/UX Designer", "Senior"),
    User("Emily Davis", Assets.images.avatar.path, "Project Manager", "Lead"),
    User("Alex Wilson", Assets.images.avatar.path, "QA Engineer", "Mid"),
    User("Lisa Brown", Assets.images.avatar.path, "DevOps Engineer", "Senior"),
    User(
      "David Rodriguez",
      Assets.images.avatar.path,
      "Full Stack Developer",
      "Senior",
    ),
    User("Anna Thompson", Assets.images.avatar.path, "Product Owner", "Lead"),
    User("James Lee", Assets.images.avatar.path, "Mobile Developer", "Mid"),
    User("Rachel Green", Assets.images.avatar.path, "Data Analyst", "Junior"),
    User(
      "Tom Anderson",
      Assets.images.avatar.path,
      "Security Engineer",
      "Senior",
    ),
    User("Maria Garcia", Assets.images.avatar.path, "Scrum Master", "Mid"),
    User(
      "Kevin Park",
      Assets.images.avatar.path,
      "Frontend Developer",
      "Junior",
    ),
    User(
      "Sophie Miller",
      Assets.images.avatar.path,
      "Backend Developer",
      "Senior",
    ),
    User("Ryan Clark", Assets.images.avatar.path, "DevOps Engineer", "Mid"),
  ];

  // 事件数据
  static List<Event> eventList = [
    Event(
      title: "Presentation of the new department",
      time: "Today | 5:00 PM",
      timeConsume: "4h",
      lever: EventLever.high,
    ),
    Event(
      title: "Anna's Birthday",
      time: "Today | 6:00 PM",
      timeConsume: "4h",
      lever: EventLever.medium,
    ),
    Event(
      title: "Ray's Birthday",
      time: "Tomorrow | 2:00 PM",
      timeConsume: "4h",
      lever: EventLever.low,
    ),
    Event(
      title: "Team Meeting",
      time: "Tomorrow | 10:00 AM",
      timeConsume: "2h",
      lever: EventLever.medium,
    ),
    Event(
      title: "Client Presentation",
      time: "Friday | 3:00 PM",
      timeConsume: "3h",
      lever: EventLever.high,
    ),
    Event(
      title: "Sprint Planning",
      time: "Monday | 9:00 AM",
      timeConsume: "2h",
      lever: EventLever.high,
    ),
    Event(
      title: "Code Review Session",
      time: "Tuesday | 11:00 AM",
      timeConsume: "1.5h",
      lever: EventLever.medium,
    ),
    Event(
      title: "Product Demo",
      time: "Wednesday | 4:00 PM",
      timeConsume: "1h",
      lever: EventLever.high,
    ),
    Event(
      title: "Team Lunch",
      time: "Thursday | 12:30 PM",
      timeConsume: "1h",
      lever: EventLever.low,
    ),
    Event(
      title: "Quarterly Review",
      time: "Next Week | 2:00 PM",
      timeConsume: "3h",
      lever: EventLever.high,
    ),
    Event(
      title: "Training Workshop",
      time: "Next Week | 10:00 AM",
      timeConsume: "4h",
      lever: EventLever.medium,
    ),
    Event(
      title: "Stakeholder Meeting",
      time: "Next Friday | 1:00 PM",
      timeConsume: "2h",
      lever: EventLever.high,
    ),
  ];

  // 任务数据
  static List<Task> taskList = [
    Task(
      name: "User Authentication System",
      estimate: "120h",
      spentTime: "80h",
      priority: Priority.high,
      taskStatus: TaskStatus.progress,
      assignee: [userList[0], userList[1], userList[2]],
      taskType: TaskType.active,
      progress: 0.67,
    ),
    Task(
      name: "Dashboard Analytics Integration",
      estimate: "200h",
      spentTime: "205h",
      priority: Priority.medium,
      taskStatus: TaskStatus.done,
      assignee: [userList[1], userList[3], userList[4], userList[5]],
      taskType: TaskType.active,
      progress: 1.0,
    ),
    Task(
      name: "Logo Design and Branding",
      estimate: "40h",
      spentTime: "5h",
      priority: Priority.low,
      taskStatus: TaskStatus.todo,
      assignee: [userList[2], userList[0]],
      taskType: TaskType.backlog,
      progress: 0.12,
    ),
    Task(
      name: "Responsive Layout Implementation",
      estimate: "150h",
      spentTime: "140h",
      priority: Priority.high,
      taskStatus: TaskStatus.review,
      assignee: [userList[3], userList[1], userList[4], userList[2]],
      taskType: TaskType.active,
      progress: 0.93,
    ),
    Task(
      name: "Unit Test Coverage",
      estimate: "60h",
      spentTime: "0h",
      priority: Priority.medium,
      taskStatus: TaskStatus.todo,
      assignee: [userList[4], userList[5], userList[0]],
      taskType: TaskType.backlog,
      progress: 0.0,
    ),
    Task(
      name: "Performance Optimization",
      estimate: "80h",
      spentTime: "75h",
      priority: Priority.high,
      taskStatus: TaskStatus.progress,
      assignee: [userList[5], userList[1]],
      taskType: TaskType.active,
      progress: 0.94,
    ),
    Task(
      name: "Payment Gateway Integration",
      estimate: "300h",
      spentTime: "150h",
      priority: Priority.high,
      taskStatus: TaskStatus.progress,
      assignee: [userList[6], userList[7], userList[8], userList[9]],
      taskType: TaskType.active,
      progress: 0.50,
    ),
    Task(
      name: "Admin Panel Development",
      estimate: "90h",
      spentTime: "90h",
      priority: Priority.medium,
      taskStatus: TaskStatus.done,
      assignee: [userList[10], userList[11]],
      taskType: TaskType.active,
      progress: 1.0,
    ),
    Task(
      name: "Mobile App UI/UX Design",
      estimate: "180h",
      spentTime: "160h",
      priority: Priority.high,
      taskStatus: TaskStatus.review,
      assignee: [userList[12], userList[13], userList[14], userList[0]],
      taskType: TaskType.active,
      progress: 0.89,
    ),
    Task(
      name: "Documentation Writing",
      estimate: "25h",
      spentTime: "0h",
      priority: Priority.low,
      taskStatus: TaskStatus.todo,
      assignee: [userList[1], userList[3]],
      taskType: TaskType.backlog,
      progress: 0.0,
    ),
    Task(
      name: "Database Schema Design",
      estimate: "220h",
      spentTime: "100h",
      priority: Priority.medium,
      taskStatus: TaskStatus.progress,
      assignee: [userList[2], userList[4], userList[6], userList[8]],
      taskType: TaskType.backlog,
      progress: 0.45,
    ),
    Task(
      name: "Chatbot Training Data",
      estimate: "50h",
      spentTime: "10h",
      priority: Priority.low,
      taskStatus: TaskStatus.todo,
      assignee: [userList[7], userList[9], userList[11]],
      taskType: TaskType.backlog,
      progress: 0.20,
    ),
  ];

  // 项目数据（根据Project实体类结构）
  static List<Project> projectList = [
    Project(
      id: "PN0001245",
      name: "CRM Mobile App",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      priority: Priority.high,
      tasks: taskList,
    ),
    Project(
      id: "PN0001241",
      name: "Admin Dashboard",
      icon: Assets.images.projectImage,
      createTime: "Sep 10, 2020",
      priority: Priority.medium,
      tasks: [taskList[1], taskList[7]],
    ),
    Project(
      id: "PN0001242",
      name: "Brand Identity",
      icon: Assets.images.projectImage,
      createTime: "Sep 8, 2020",
      priority: Priority.low,
      tasks: [taskList[2], taskList[9], taskList[11]],
    ),
    Project(
      id: "PN0001243",
      name: "Website Redesign",
      icon: Assets.images.projectImage,
      createTime: "Sep 15, 2020",
      priority: Priority.high,
      tasks: [taskList[4], taskList[8]],
    ),
    Project(
      id: "PN0001244",
      name: "QA Testing",
      icon: Assets.images.projectImage,
      createTime: "Sep 20, 2020",
      priority: Priority.medium,
      tasks: [taskList[5]],
    ),
    Project(
      id: "PN0001246",
      name: "API Integration",
      icon: Assets.images.projectImage,
      createTime: "Sep 25, 2020",
      priority: Priority.high,
      tasks: [taskList[6]],
    ),
    Project(
      id: "PN0001247",
      name: "E-commerce Platform",
      icon: Assets.images.projectImage,
      createTime: "Oct 1, 2020",
      priority: Priority.high,
      tasks: [taskList[10]],
    ),
    Project(
      id: "PN0001248",
      name: "Data Analytics Tool",
      icon: Assets.images.projectImage,
      createTime: "Oct 5, 2020",
      priority: Priority.medium,
      tasks: [],
    ),
    Project(
      id: "PN0001249",
      name: "Security Audit",
      icon: Assets.images.projectImage,
      createTime: "Oct 10, 2020",
      priority: Priority.high,
      tasks: [],
    ),
    Project(
      id: "PN0001250",
      name: "Mobile Banking App",
      icon: Assets.images.projectImage,
      createTime: "Oct 15, 2020",
      priority: Priority.high,
      tasks: [],
    ),
    Project(
      id: "PN0001251",
      name: "Cloud Migration",
      icon: Assets.images.projectImage,
      createTime: "Oct 20, 2020",
      priority: Priority.medium,
      tasks: [],
    ),
    Project(
      id: "PN0001252",
      name: "AI Chatbot",
      icon: Assets.images.projectImage,
      createTime: "Oct 25, 2020",
      priority: Priority.low,
      tasks: [],
    ),
  ];

  // 活动数据
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
    Activity(
      username: "Sarah Johnson",
      avatar: Assets.images.avatar.path,
      userRole: "Backend Developer",
      item: [
        ActivityItem(
          content: "Fixed critical API authentication bug",
          iconData: Icons.bug_report_rounded,
          iconColor: const Color(0xffFF4D4F),
        ),
        ActivityItem(
          content: "Implemented new user registration endpoint",
          iconData: Icons.code_rounded,
          iconColor: const Color(0xff3F8CFF),
        ),
      ],
    ),
    Activity(
      username: "Mike Chen",
      avatar: Assets.images.avatar.path,
      userRole: "UI/UX Designer",
      item: [
        ActivityItem(
          content: "Created new dashboard wireframes",
          iconData: Icons.design_services_rounded,
          iconColor: const Color(0xffC419E6),
        ),
        ActivityItem(
          content: "Updated brand color palette",
          iconData: Icons.palette_rounded,
          iconColor: const Color(0xff0AC947),
        ),
      ],
    ),
    Activity(
      username: "Emily Davis",
      avatar: Assets.images.avatar.path,
      userRole: "Project Manager",
      item: [
        ActivityItem(
          content: "Scheduled sprint planning meeting",
          iconData: Icons.schedule_rounded,
          iconColor: const Color(0xff3F8CFF),
        ),
        ActivityItem(
          content: "Reviewed and approved project milestones",
          iconData: Icons.approval_rounded,
          iconColor: const Color(0xff0AC947),
        ),
        ActivityItem(
          content: "Updated project timeline and deliverables",
          iconData: Icons.timeline_rounded,
          iconColor: const Color(0xffFF9500),
        ),
      ],
    ),
    Activity(
      username: "Alex Wilson",
      avatar: Assets.images.avatar.path,
      userRole: "QA Engineer",
      item: [
        ActivityItem(
          content: "Executed automated test suite",
          iconData: Icons.play_circle_outline_rounded,
          iconColor: const Color(0xff0AC947),
        ),
        ActivityItem(
          content: "Reported 5 critical bugs in mobile app",
          iconData: Icons.report_problem_rounded,
          iconColor: const Color(0xffFF4D4F),
        ),
      ],
    ),
    Activity(
      username: "Lisa Brown",
      avatar: Assets.images.avatar.path,
      userRole: "DevOps Engineer",
      item: [
        ActivityItem(
          content: "Deployed new version to staging environment",
          iconData: Icons.cloud_upload_rounded,
          iconColor: const Color(0xff3F8CFF),
        ),
        ActivityItem(
          content: "Optimized CI/CD pipeline performance",
          iconData: Icons.speed_rounded,
          iconColor: const Color(0xff0AC947),
        ),
        ActivityItem(
          content: "Set up monitoring alerts for production",
          iconData: Icons.monitor_heart_rounded,
          iconColor: const Color(0xffFF9500),
        ),
      ],
    ),
    Activity(
      username: "David Rodriguez",
      avatar: Assets.images.avatar.path,
      userRole: "Full Stack Developer",
      item: [
        ActivityItem(
          content: "Integrated payment gateway API",
          iconData: Icons.payment_rounded,
          iconColor: const Color(0xff0AC947),
        ),
        ActivityItem(
          content: "Refactored database queries for better performance",
          iconData: Icons.storage_rounded,
          iconColor: const Color(0xff3F8CFF),
        ),
      ],
    ),
    Activity(
      username: "Anna Thompson",
      avatar: Assets.images.avatar.path,
      userRole: "Product Owner",
      item: [
        ActivityItem(
          content: "Defined user stories for next sprint",
          iconData: Icons.description_rounded,
          iconColor: const Color(0xffC419E6),
        ),
        ActivityItem(
          content: "Conducted stakeholder feedback session",
          iconData: Icons.feedback_rounded,
          iconColor: const Color(0xff0AC947),
        ),
        ActivityItem(
          content: "Prioritized product backlog items",
          iconData: Icons.priority_high_rounded,
          iconColor: const Color(0xffFF9500),
        ),
      ],
    ),
  ];
}

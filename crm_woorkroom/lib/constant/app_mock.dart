import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/entity/activity.dart';
import 'package:crm_woorkroom/entity/calendar.dart';
import 'package:crm_woorkroom/entity/event.dart';
import 'package:crm_woorkroom/entity/file.dart';
import 'package:crm_woorkroom/entity/project.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/entity/user.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppMock {
  static final DateTime _now = DateTime.now();

  static List<Calendar> calendarList = [
    Calendar(
      title: "Client Requirements Meeting",
      priority: Priority.high,
      spentTime: "2h",
      createTime: DateTime(_now.year, _now.month, 3),
    ),
    Calendar(
      title: "UI Design Review",
      priority: Priority.medium,
      spentTime: "3.5h",
      createTime: DateTime(_now.year, _now.month, 5),
    ),
    Calendar(
      title: "Fix Critical Bugs",
      priority: Priority.low,
      spentTime: "1h",
      createTime: DateTime(_now.year, _now.month, 5),
    ),
    Calendar(
      title: "Sprint Sync Session",
      priority: Priority.high,
      spentTime: "1.5h",
      createTime: DateTime(_now.year, _now.month, 5),
    ),
    Calendar(
      title: "Technical Proposal Review",
      priority: Priority.medium,
      spentTime: "4h",
      createTime: DateTime(_now.year, _now.month, 5),
    ),
    Calendar(
      title: "Weekly Report Archiving",
      priority: Priority.low,
      spentTime: "0.5h",
      createTime: DateTime(_now.year, _now.month, 12),
    ),
    Calendar(
      title: "Product Retrospective",
      priority: Priority.high,
      spentTime: "2h",
      createTime: DateTime(_now.year, _now.month, 15),
    ),
    Calendar(
      title: "Feature Code Review",
      priority: Priority.medium,
      spentTime: "1h",
      createTime: DateTime(_now.year, _now.month, 15),
    ),
    Calendar(
      title: "Database Maintenance",
      priority: Priority.high,
      spentTime: "5h",
      createTime: DateTime(_now.year, _now.month, 18),
    ),
    Calendar(
      title: "Design Detail Polishing",
      priority: Priority.low,
      spentTime: "2.5h",
      createTime: DateTime(_now.year, _now.month, 20),
    ),
    Calendar(
      title: "New Client Demo",
      priority: Priority.high,
      spentTime: "1.5h",
      createTime: DateTime(_now.year, _now.month, 22),
    ),
    Calendar(
      title: "API Documentation Update",
      priority: Priority.medium,
      spentTime: "2h",
      createTime: DateTime(_now.year, _now.month, 24),
    ),
    Calendar(
      title: "Annual Strategy Rehearsal",
      priority: Priority.high,
      spentTime: "3h",
      createTime: DateTime(_now.year, _now.month, 26),
    ),
    Calendar(
      title: "Team Building Event",
      priority: Priority.low,
      spentTime: "4h",
      createTime: DateTime(_now.year, _now.month, 28),
    ),
    Calendar(
      title: "Monthly Financial Settlement",
      priority: Priority.high,
      spentTime: "1h",
      createTime: DateTime(_now.year, _now.month, 30),
    ),
  ];

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

  static List<Task> taskList = [
    Task(
      id: "TS0000001",
      name: "User Authentication System",
      description:
          "Implement a robust and secure multi-factor authentication system. This includes integrating OAuth2 for Google and Apple logins, setting up JWT token refresh logic on the backend, and designing the frontend UI for login, password recovery, and biometric prompts to ensure a seamless user experience.",
      createTime: DateTime(2026, 1, 1),
      estimateTime: 120,
      spentTime: 80,
      priority: Priority.high,
      taskStatus: TaskStatus.progress,
      taskGroup: TaskGroup.development,
      reporter: userList[5],
      assignee: userList[0],
      taskType: TaskType.active,
      progress: 0.67,
      activityList: [activityList[1], activityList[6]],
      attachments: [
        TaskFile(
          name: "Auth_Flow_Diagram.png",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 2),
        ),
        TaskFile(
          name: "Security_Specs.pdf",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 2),
        ),
      ],
    ),
    Task(
      id: "TS0000002",
      name: "Dashboard Analytics Integration",
      description:
          "Develop the data visualization layer for the executive dashboard. This task involves mapping real-time data from the analytics engine to various chart types, ensuring that filters for date ranges and categories work instantaneously, and optimizing the data fetching layer to minimize latency during peak traffic periods.",
      createTime: DateTime(2026, 1, 3),
      estimateTime: 200,
      spentTime: 205,
      priority: Priority.medium,
      taskStatus: TaskStatus.done,
      taskGroup: TaskGroup.development,
      reporter: userList[0],
      assignee: userList[1],
      taskType: TaskType.active,
      progress: 1.0,
      activityList: [activityList[2]],
      attachments: [
        TaskFile(
          name: "Analytics_UI_Final.jpg",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 4),
        ),
      ],
    ),
    Task(
      id: "TS0000003",
      name: "Logo Design and Branding",
      description:
          "Create a modern and cohesive visual identity for the brand. The scope includes designing the primary logo, secondary marks, and a complete color palette. Additionally, a brand guidelines document must be produced to specify typography, spacing, and icon usage across all digital and print platforms.",
      createTime: DateTime(2026, 1, 5),
      estimateTime: 40,
      spentTime: 5,
      priority: Priority.low,
      taskStatus: TaskStatus.todo,
      taskGroup: TaskGroup.design,
      reporter: userList[1],
      assignee: userList[2],
      taskType: TaskType.backlog,
      progress: 0.12,
      activityList: [activityList[2]],
      attachments: [
        TaskFile(
          name: "Brand_Moodboard.pdf",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 5),
        ),
        TaskFile(
          name: "Logo_Drafts.zip",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 6),
        ),
      ],
    ),
    Task(
      id: "TS0000004",
      name: "Responsive Layout Implementation",
      description:
          "Refactor the existing frontend code to support a fully responsive design across all major screen sizes. This involves implementing a mobile-first grid system, optimizing navigation menus for touch interfaces, and testing on various browsers (Chrome, Safari, Firefox) to ensure visual consistency and performance.",
      createTime: DateTime(2026, 1, 7),
      estimateTime: 150,
      spentTime: 140,
      priority: Priority.high,
      taskStatus: TaskStatus.review,
      taskGroup: TaskGroup.development,
      reporter: userList[2],
      assignee: userList[3],
      taskType: TaskType.active,
      progress: 0.93,
      activityList: [activityList[0], activityList[3]],
      attachments: [
        TaskFile(
          name: "Responsive_Breakpoints.xlsx",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 8),
        ),
      ],
    ),
    Task(
      id: "TS0000005",
      name: "Unit Test Coverage",
      description:
          "Increase the overall reliability of the codebase by implementing comprehensive unit tests for all core business logic. Focus on edge cases in the payment and authentication modules, ensuring that test coverage reaches at least 80% and that all tests are integrated into the automated CI/CD pipeline.",
      createTime: DateTime(2026, 1, 8),
      estimateTime: 60,
      spentTime: 0,
      priority: Priority.medium,
      taskStatus: TaskStatus.todo,
      taskGroup: TaskGroup.testing,
      reporter: userList[3],
      assignee: userList[4],
      taskType: TaskType.backlog,
      progress: 0.0,
      activityList: [activityList[4]],
      attachments: [],
    ),
    Task(
      id: "TS0000006",
      name: "Performance Optimization",
      description:
          "Analyze and resolve performance bottlenecks within the application. Key activities include optimizing SQL queries to reduce execution time, implementing server-side caching mechanisms, and minifying frontend assets to improve the First Contentful Paint (FCP) and overall User Experience (UX) metrics.",
      createTime: DateTime(2026, 1, 10),
      estimateTime: 80,
      spentTime: 75,
      priority: Priority.high,
      taskStatus: TaskStatus.progress,
      taskGroup: TaskGroup.development,
      reporter: userList[4],
      assignee: userList[5],
      taskType: TaskType.active,
      progress: 0.94,
      activityList: [activityList[5], activityList[6]],
      attachments: [
        TaskFile(
          name: "Benchmark_Results.pdf",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 11),
        ),
      ],
    ),
    Task(
      id: "TS0000007",
      name: "Payment Gateway Integration",
      description:
          "Integrate multi-currency payment support via Stripe and PayPal. This task covers setting up secure webhooks to handle transaction status updates, implementing a subscription management portal for users, and ensuring full compliance with PCI-DSS security standards for handling sensitive financial data.",
      createTime: DateTime(2026, 1, 12),
      estimateTime: 300,
      spentTime: 150,
      priority: Priority.high,
      taskStatus: TaskStatus.progress,
      taskGroup: TaskGroup.development,
      reporter: userList[0],
      assignee: userList[6],
      taskType: TaskType.active,
      progress: 0.50,
      activityList: [activityList[6]],
      attachments: [
        TaskFile(
          name: "API_Documentation_Stripe.pdf",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 13),
        ),
      ],
    ),
    Task(
      id: "TS0000008",
      name: "Admin Panel Development",
      description:
          "Build a comprehensive administration interface for system moderators. Features include user account management, role-based access control (RBAC) settings, system activity logs, and a content management system (CMS) to update public-facing website information without requiring code deployments.",
      createTime: DateTime(2026, 1, 15),
      estimateTime: 90,
      spentTime: 90,
      priority: Priority.medium,
      taskStatus: TaskStatus.done,
      taskGroup: TaskGroup.development,
      reporter: userList[2],
      assignee: userList[10],
      taskType: TaskType.active,
      progress: 1.0,
      activityList: [activityList[0], activityList[7]],
      attachments: [
        TaskFile(
          name: "Admin_Panel_Sitemap.png",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 16),
        ),
      ],
    ),
    Task(
      id: "TS0000009",
      name: "Mobile App UI/UX Design",
      description:
          "Design high-fidelity interactive prototypes for the native mobile application. The process includes conducting user research, creating wireframes for all major user journeys, and final visual design that adheres to the established brand identity while following Material Design and iOS Human Interface Guidelines.",
      createTime: DateTime(2026, 1, 18),
      estimateTime: 180,
      spentTime: 160,
      priority: Priority.high,
      taskStatus: TaskStatus.review,
      taskGroup: TaskGroup.design,
      reporter: userList[1],
      assignee: userList[12],
      taskType: TaskType.active,
      progress: 0.89,
      activityList: [activityList[2]],
      attachments: [
        TaskFile(
          name: "Mobile_Prototypes_V1.fig",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 19),
        ),
        TaskFile(
          name: "User_Research_Summary.docx",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 19),
        ),
      ],
    ),
    Task(
      id: "TS0000010",
      name: "Documentation Writing",
      description:
          "Create detailed documentation for both technical and non-technical stakeholders. This includes an API reference guide for developers, a system architecture overview, and an end-user manual that explains how to use each feature of the application with screenshots and step-by-step tutorials.",
      createTime: DateTime(2026, 1, 20),
      estimateTime: 25,
      spentTime: 0,
      priority: Priority.low,
      taskStatus: TaskStatus.todo,
      taskGroup: TaskGroup.projectManagement,
      reporter: userList[12],
      assignee: userList[1],
      taskType: TaskType.backlog,
      progress: 0.0,
      activityList: [activityList[7]],
      attachments: [
        TaskFile(
          name: "User_Manual_Draft.pdf",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 21),
        ),
      ],
    ),
    Task(
      id: "TS0000011",
      name: "Database Schema Design",
      description:
          "Design and normalize the relational database schema to support high-scale operations. This involves defining table structures for users, projects, and tasks, establishing efficient indexing strategies for search queries, and setting up foreign key constraints to maintain data integrity throughout the system lifecycle.",
      createTime: DateTime(2026, 1, 22),
      estimateTime: 220,
      spentTime: 100,
      priority: Priority.medium,
      taskStatus: TaskStatus.progress,
      taskGroup: TaskGroup.development,
      reporter: userList[10],
      assignee: userList[2],
      taskType: TaskType.backlog,
      progress: 0.45,
      activityList: [activityList[6], activityList[5]],
      attachments: [
        TaskFile(
          name: "ER_Diagram_Final.png",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 22),
        ),
      ],
    ),
    Task(
      id: "TS0000012",
      name: "Chatbot Training Data",
      description:
          "Collect and curate a high-quality dataset for training the customer support AI chatbot. This includes cleaning historical support tickets, categorizing common user intents, and formatting the data into JSON structures compatible with the Natural Language Processing (NLP) engine to improve response accuracy.",
      createTime: DateTime(2026, 1, 23),
      estimateTime: 50,
      spentTime: 10,
      priority: Priority.low,
      taskStatus: TaskStatus.todo,
      taskGroup: TaskGroup.testing,
      reporter: userList[5],
      assignee: userList[7],
      taskType: TaskType.backlog,
      progress: 0.20,
      activityList: [activityList[4], activityList[7]],
      attachments: [
        TaskFile(
          name: "Training_Sample.json",
          url: Assets.images.taskFile.path,
          uploadTime: DateTime(2026, 1, 24),
        ),
      ],
    ),
  ];

  static List<Project> projectList = [
    Project(
      id: "PN0001245",
      name: "CRM Mobile App",
      icon: Assets.images.projectImage,
      createTime: "Sep 12, 2020",
      deadline: "Dec 12, 2020",
      description:
          "Developing a comprehensive CRM mobile application for real-time client management.",
      reporter: userList[0],
      priority: Priority.high,
      tasks: taskList,
    ),
    Project(
      id: "PN0001241",
      name: "Admin Dashboard",
      icon: Assets.images.projectImage,
      createTime: "Sep 10, 2020",
      deadline: "Nov 30, 2020",
      description:
          "Internal dashboard for monitoring system performance and user activity.",
      reporter: userList[1],
      priority: Priority.medium,
      tasks: [taskList[1], taskList[7]],
    ),
    Project(
      id: "PN0001242",
      name: "Brand Identity",
      icon: Assets.images.projectImage,
      createTime: "Sep 8, 2020",
      deadline: "Oct 20, 2020",
      description:
          "Rebranding initiative including logo design and style guide creation.",
      reporter: userList[2],
      priority: Priority.low,
      tasks: [taskList[2], taskList[9], taskList[11]],
    ),
    Project(
      id: "PN0001243",
      name: "Website Redesign",
      icon: Assets.images.projectImage,
      createTime: "Sep 15, 2020",
      deadline: "Dec 01, 2020",
      description:
          "Modernizing the corporate website with a focus on responsive design.",
      reporter: userList[0],
      priority: Priority.high,
      tasks: [taskList[4], taskList[8]],
    ),
    Project(
      id: "PN0001244",
      name: "QA Testing",
      icon: Assets.images.projectImage,
      createTime: "Sep 20, 2020",
      deadline: "Sep 30, 2020",
      description:
          "End-to-end testing phase for the upcoming software release.",
      reporter: userList[3],
      priority: Priority.medium,
      tasks: [taskList[5]],
    ),
    Project(
      id: "PN0001246",
      name: "API Integration",
      icon: Assets.images.projectImage,
      createTime: "Sep 25, 2020",
      deadline: "Oct 15, 2020",
      description:
          "Connecting third-party payment gateways and logistics APIs.",
      reporter: userList[1],
      priority: Priority.high,
      tasks: [taskList[6]],
    ),
    Project(
      id: "PN0001247",
      name: "E-commerce Platform",
      icon: Assets.images.projectImage,
      createTime: "Oct 1, 2020",
      deadline: "Jan 15, 2021",
      description:
          "Building a scalable B2B e-commerce solution with multi-vendor support.",
      reporter: userList[2],
      priority: Priority.high,
      tasks: [taskList[10]],
    ),
    Project(
      id: "PN0001248",
      name: "Data Analytics Tool",
      icon: Assets.images.projectImage,
      createTime: "Oct 5, 2020",
      deadline: "Dec 20, 2020",
      description:
          "A tool for visualizing complex datasets and generating automated reports.",
      reporter: userList[4],
      priority: Priority.medium,
      tasks: [],
    ),
    Project(
      id: "PN0001249",
      name: "Security Audit",
      icon: Assets.images.projectImage,
      createTime: "Oct 10, 2020",
      deadline: "Oct 25, 2020",
      description:
          "Comprehensive security assessment and vulnerability patching.",
      reporter: userList[0],
      priority: Priority.high,
      tasks: [],
    ),
    Project(
      id: "PN0001250",
      name: "Mobile Banking App",
      icon: Assets.images.projectImage,
      createTime: "Oct 15, 2020",
      deadline: "Mar 10, 2021",
      description:
          "Secure mobile banking application with biometric authentication.",
      reporter: userList[5],
      priority: Priority.high,
      tasks: [],
    ),
    Project(
      id: "PN0001251",
      name: "Cloud Migration",
      icon: Assets.images.projectImage,
      createTime: "Oct 20, 2020",
      deadline: "Nov 15, 2020",
      description:
          "Moving legacy infrastructure to a secure cloud-based environment.",
      reporter: userList[1],
      priority: Priority.medium,
      tasks: [],
    ),
    Project(
      id: "PN0001252",
      name: "AI Chatbot",
      icon: Assets.images.projectImage,
      createTime: "Oct 25, 2020",
      deadline: "Dec 30, 2020",
      description:
          "Implementing an AI-driven chatbot for automated customer support.",
      reporter: userList[2],
      priority: Priority.low,
      tasks: [],
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

import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/calendar/calendar_page.dart';
import 'package:crm_woorkroom/presentation/dashboard/dashboard_page.dart';
import 'package:crm_woorkroom/presentation/employees/employees_page.dart';
import 'package:crm_woorkroom/presentation/home/component/home_header.dart';
import 'package:crm_woorkroom/presentation/home/component/home_navigation.dart';
import 'package:crm_woorkroom/presentation/messenger/messenger_page.dart';
import 'package:crm_woorkroom/presentation/portal/portal_page.dart';
import 'package:crm_woorkroom/presentation/projects/projects_page.dart';
import 'package:crm_woorkroom/presentation/vacations/vacations_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeNavIndex = 0;

  final List<Widget> _views = [
    DashboardPage(),
    ProjectsPage(),
    CalendarPage(),
    VacationsPage(),
    EmployeesPage(),
    MessengerPage(),
    PortalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.backgroundColor,
      child: Padding(
        padding: (AppLayout.paddingLarge * 1.2).allPadding,
        child: Row(
          children: [
            HomeNavigation(
              onChanged: (int value) {
                setState(() {
                  _activeNavIndex = value;
                });
              },
            ),
            AppLayout.paddingMedium.widthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(),
                  AppLayout.paddingLarge.heightBox,
                  Expanded(child: _views[_activeNavIndex]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

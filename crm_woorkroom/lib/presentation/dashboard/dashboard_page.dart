import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/dashboard/component/dash_activity_stream.dart';
import 'package:crm_woorkroom/presentation/dashboard/component/dash_nearest_events.dart';
import 'package:crm_woorkroom/presentation/dashboard/component/dash_projects.dart';
import 'package:crm_woorkroom/presentation/dashboard/component/dash_workload.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _workloadAnimation;
  late final Animation _eventAnimation;
  late final Animation _projectAnimation;
  late final Animation _activityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _workloadAnimation = CurvedAnimation(
      curve: Interval(0, 0.25),
      parent: _controller,
    );
    _eventAnimation = CurvedAnimation(
      curve: Interval(0.25, 0.5),
      parent: _controller,
    );
    _projectAnimation = CurvedAnimation(
      curve: Interval(0.5, 0.75),
      parent: _controller,
    );
    _activityAnimation = CurvedAnimation(
      curve: Interval(0.75, 1),
      parent: _controller,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back,Evan!",
              style: TextTheme.of(context).labelMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dashboard", style: TextTheme.of(context).displayMedium),
                Container(
                  width: 180,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.paddingSmall,
                    vertical: AppLayout.paddingSmall * 0.5,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffE6EDF5),
                    borderRadius: BorderRadius.circular(
                      AppLayout.borderRadius / 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 15),
                      Spacer(),
                      Text(
                        "Now 16,2020 - Dec 16,2020",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppLayout.paddingMedium.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedBuilder(
                  animation: _workloadAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 20.0 * (1 - _workloadAnimation.value)),
                      child: Opacity(
                        opacity: _workloadAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: DashWorkloadCard(width: width, height: height),
                ),
                AnimatedBuilder(
                  animation: _eventAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 20.0 * (1 - _eventAnimation.value)),
                      child: Opacity(
                        opacity: _eventAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: DashNearestEvents(width: width, height: height),
                ),
              ],
            ),
            AppLayout.paddingMedium.heightBox,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedBuilder(
                    animation: _projectAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(20.0 * (1 - _projectAnimation.value), 0),
                        child: Opacity(
                          opacity: _projectAnimation.value,
                          child: child,
                        ),
                      );
                    },
                    child: DashProjects(width: width, height: height),
                  ),
                  AnimatedBuilder(
                    animation: _activityAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(-20.0 * (1 - _activityAnimation.value), 0),
                        child: Opacity(
                          opacity: _activityAnimation.value,
                          child: child,
                        ),
                      );
                    },
                    child: DashActivityStream(width: width, height: height),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

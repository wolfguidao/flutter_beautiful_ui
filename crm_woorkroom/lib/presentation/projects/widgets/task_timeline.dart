import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_scroller_bar.dart';
import 'package:flutter/material.dart';

class TaskTimeline extends StatefulWidget {
  final List<Task> taskList;
  const TaskTimeline({super.key, required this.taskList});

  @override
  State<TaskTimeline> createState() => _TaskTimelineState();
}

class _TaskTimelineState extends State<TaskTimeline> {
  late ScrollController _controller;
  late DateTime _dateTime;

  @override
  void initState() {
    _controller = ScrollController();
    _dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: (AppLayout.paddingSmall * 0.3).verticalPadding,
          child: Text(
            _dateTime.enMonth,
            style: TextTheme.of(context).bodyMedium,
          ),
        ),
        Expanded(
          child: CustomScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverList.builder(
                itemCount: DateTime(_dateTime.year, _dateTime.month + 1, 0).day,
                itemBuilder: (context, index) {
                  final DateTime date = DateTime(
                    _dateTime.year,
                    _dateTime.month,
                    index + 1,
                  );
                  return Column(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: (AppLayout.paddingSmall * 0.3).verticalPadding,
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(
                            AppLayout.borderRadius / 2,
                          ),
                        ),
                        child: Center(child: Text(date.day.toString())),
                      ),
                      Container(color: Color(0xffE6EBF5), height: 1, width: 30),
                      ...widget.taskList.map((task) {
                        final bool isDuringDate =
                            date.isAfter(task.createTime) &&
                            date.isBefore(task.deadline);
                        return Container(
                          width: 25,
                          margin: (AppLayout.paddingSmall / 2).verticalPadding,
                          height: 30,
                          decoration: BoxDecoration(
                            color: isDuringDate
                                ? Color(0xffA7CAFF)
                                : Color(0xffF4F9FD),
                            borderRadius: BorderRadius.circular(
                              AppLayout.borderRadius / 2,
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Divider(color: Color(0xffE6EBF5), height: 0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: AppLayout.paddingSmall.horizontalPadding,
                child: CusScrollerBar(
                  scrollController: _controller,
                  backgorundColor: Color(0xffF6F8FD),
                  barColor: Color(0xffD3DBEB),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 15,
                color: AppColor.primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                size: 15,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

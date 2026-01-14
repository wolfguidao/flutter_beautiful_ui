import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_data.dart';
import 'package:saas_dashboard/entity/schedule/task.dart';
import 'package:saas_dashboard/presentation/schedule/widget/task_board_line.dart';

class ScheduleBoardView extends StatefulWidget {
  const ScheduleBoardView({super.key});

  @override
  State<ScheduleBoardView> createState() => _ScheduleBoardViewState();
}

class _ScheduleBoardViewState extends State<ScheduleBoardView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Map<String, List<Task>> _taskMap = {
    "ToDo": todoList,
    "In Progress": doingList,
    "In Review": doingList,
    "Done": doneList,
  };

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
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
        final double width = constraints.maxWidth / 4;
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_taskMap.length, (index) {
                final String key = _taskMap.keys.elementAt(index);
                final List<Task> value = _taskMap[key]!;
                final Animation animation = CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    1 / _taskMap.length * index,
                    1 / _taskMap.length * (1 + index),
                  ),
                );
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(20.0 * (1 - animation.value), 0),
                      child: Opacity(opacity: animation.value, child: child),
                    );
                  },
                  child: TaskBoardLine(
                    title: key,
                    taskList: value,
                    width: width,
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

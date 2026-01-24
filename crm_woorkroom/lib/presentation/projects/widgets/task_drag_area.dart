import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/presentation/projects/widgets/task_board_item.dart';
import 'package:flutter/material.dart';

class TaskDragArea extends StatelessWidget {
  final List<Task> tasks;
  final Task? draggingTask;
  final TaskType taskType;
  final double width;
  final Function(Task, TaskStatus, TaskType) onTaskDropped;
  final ValueChanged<Task> onDragStarted;
  final VoidCallback onDragEnd;
  final ValueChanged onTapTask;
  const TaskDragArea({
    super.key,
    required this.tasks,
    required this.width,
    required this.onTaskDropped,
    required this.onDragStarted,
    required this.onDragEnd,
    required this.taskType,
    this.draggingTask,
    required this.onTapTask,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(TaskStatus.values.length, (index) {
        final TaskStatus status = TaskStatus.values[index];
        final bool showTarget =
            draggingTask == null ||
            (draggingTask?.taskStatus == status &&
                draggingTask?.taskType == taskType);
        return Expanded(
          flex: 1,
          child: Column(
            children: [
              ...tasks.where((e) => e.taskStatus == status).map((task) {
                return GestureDetector(
                  onTap: () => onTapTask(task),
                  child: TaskBoardItem(
                    task: task,
                    width: width,
                    onDragStarted: () => onDragStarted(task),
                    onDragEnd: onDragEnd,
                  ),
                );
              }),
              if (!showTarget)
                DragTarget<Task>(
                  onWillAcceptWithDetails: (data) {
                    return data.data.taskStatus != status ||
                        data.data.taskType != taskType;
                  },
                  onAcceptWithDetails: (detail) =>
                      onTaskDropped(detail.data, status, taskType),
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      constraints: BoxConstraints(minHeight: 80),
                      margin: EdgeInsets.only(top: AppLayout.paddingSmall),
                      width: width * 0.225,
                      padding: EdgeInsets.only(top: AppLayout.paddingSmall),
                      decoration: BoxDecoration(
                        color: Color(0xffEDF5FD),
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius,
                        ),
                        border: Border.all(
                          color: Color(0xffBAC8E3),
                          style: BorderStyle.solid,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      }),
    );
  }
}

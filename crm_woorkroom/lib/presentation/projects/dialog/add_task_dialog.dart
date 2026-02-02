import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AddTaskDialog();
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.add, size: 15),
          Text(
            "Add Task",
            style: TextStyle(
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Dialog(
      backgroundColor: AppColor.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Container(
        width: width * 0.4,
        height: height * 0.75,
        padding: AppLayout.paddingLarge.allPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Task", style: TextTheme.of(context).displayMedium),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, size: 20),
                ),
              ],
            ),
            AppLayout.paddingLarge.heightBox,
            CusLabelTextfile(label: "Task Name", hintText: "Task Name"),
            AppLayout.paddingSmall.heightBox,
            CusLabelTextfile(label: "Task Group", hintText: "Task Group"),
            AppLayout.paddingSmall.heightBox,
            Row(
              children: [
                Expanded(
                  child: CusLabelTextfile(
                    label: "Estimate",
                    hintText: "Select duration",
                  ),
                ),
                AppLayout.paddingSmall.widthBox,
                Expanded(
                  child: CusLabelTextfile(
                    label: "Dead Line",
                    hintText: "Select Date",
                  ),
                ),
              ],
            ),
            AppLayout.paddingSmall.heightBox,
            CusLabelTextfile(label: "Priority", hintText: "Medium"),
            AppLayout.paddingSmall.heightBox,
            CusLabelTextfile(label: "Assignee", hintText: "Select Assignee"),
            AppLayout.paddingSmall.heightBox,
            CusLabelTextfile(
              label: "Description",
              hintText: "Add some description of the task",
              minLines: 4,
            ),
            AppLayout.paddingSmall.heightBox,
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffF1EFFB),
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Icon(Icons.link_rounded, color: Color(0xff6D5DD3)),
                ),
                AppLayout.paddingSmall.widthBox,
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffE8F9FC),
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Icon(Icons.all_inclusive, color: Color(0xff15C0E6)),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save Task",
                  style: TextStyle(
                    fontSize: TextTheme.of(context).labelMedium?.fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

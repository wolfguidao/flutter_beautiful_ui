import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/task.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogTimeButton extends StatelessWidget {
  final Task task;
  const LogTimeButton({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(100, 40),
        maximumSize: Size(100, 40),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return LogTimeDialog(task: task);
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.access_time_rounded),
          (AppLayout.paddingSmall / 2).widthBox,
          Text(
            "Log Time",
            style: TextStyle(
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class LogTimeDialog extends StatelessWidget {
  final Task task;
  const LogTimeDialog({super.key, required this.task});

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
        height: height * 0.7,
        padding: AppLayout.paddingLarge.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time Tracking",
                  style: TextTheme.of(context).displayMedium,
                ),
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
            SizedBox(
              width: double.infinity,
              height: height * 0.15,
              child: Stack(
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  SvgPicture.asset(
                    Assets.images.timeTrackingIllus,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: AppLayout.paddingMedium.allPadding,
                    margin: AppLayout.paddingLarge.horizontalPadding,
                    height: height * 0.075,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              value: task.progress,
                            ),
                          ),
                          AppLayout.paddingLarge.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${task.spentTime} h logged"),
                              Text(
                                "Original Estimate${task.estimateTime} h",
                                style: TextTheme.of(context).labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelTextfile(
              label: "Time Spent",
              hintText: "${task.spentTime} h ",
            ),
            AppLayout.paddingMedium.heightBox,
            Row(
              children: [
                Expanded(
                  child: CusLabelTextfile(
                    label: "Date",
                    hintText: "Dec 20 ,2020",
                  ),
                ),
                AppLayout.paddingMedium.widthBox,
                Expanded(
                  child: CusLabelTextfile(label: "Time", hintText: "2:00 PM"),
                ),
              ],
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelTextfile(
              label: "Work Description",
              hintText: "Add some description of the task",
              minLines: 5,
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

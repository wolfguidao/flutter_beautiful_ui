import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusStepItem {
  String text;
  bool isActive;
  bool hasNext;
  bool hasDone;

  CusStepItem({
    required this.text,
    required this.isActive,
    required this.hasNext,
    required this.hasDone,
  });
}

class CusStepLine extends StatefulWidget {
  final List<CusStepItem> stepList;
  const CusStepLine({super.key, required this.stepList});

  @override
  State<CusStepLine> createState() => _CusStepLineState();
}

class _CusStepLineState extends State<CusStepLine> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widget.stepList.map((step) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: step.hasDone
                        ? Colors.white
                        : step.isActive
                        ? Color(0xff79AFFF)
                        : Colors.transparent,
                    border: Border.all(
                      color: step.isActive ? Colors.white : Color(0xff9FC5FF),
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: step.hasDone
                      ? Center(
                          child: Icon(
                            Icons.done,
                            size: 15,
                            color: AppColor.primaryColor,
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                if (step.hasNext)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    margin: (AppLayout.paddingSmall * 0.3).verticalPadding,
                    width: 2,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xff79AFFF),
                      border: Border.all(
                        color: step.isActive ? Colors.white : Color(0xff9FC5FF),
                        width: 1.5,
                      ),
                    ),
                  ),
              ],
            ),
            AppLayout.paddingSmall.widthBox,
            Expanded(
              child: Text(
                step.text,
                style: TextStyle(
                  fontSize: TextTheme.of(context).bodyMedium?.fontSize,
                  color: step.isActive ? Colors.white : Color(0xff9FC5FF),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

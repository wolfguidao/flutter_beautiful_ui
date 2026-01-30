import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_switch.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_checkbox.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_date_picker.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_widget.dart';
import 'package:flutter/material.dart';

class VacationRequestDialog extends StatelessWidget {
  const VacationRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return RequestDialog();
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.add, size: 15),
          Text(
            "Add Request",
            style: TextStyle(
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class RequestDialog extends StatefulWidget {
  const RequestDialog({super.key});

  @override
  State<RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  final List<String> _timeType = ["Days", "Hours"];
  String _activeType = "Days";

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
        height: height * 0.82,
        padding: AppLayout.paddingLarge.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Request", style: TextTheme.of(context).displayMedium),
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
            CusLabelWidget(
              label: "Request Type",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: VacationType.values.map((type) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingSmall,
                      vertical: AppLayout.paddingSmall * 0.75,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.borderColor),
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius / 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        CusCheckbox(value: false, onChanged: (value) {}),
                        AppLayout.paddingSmall.widthBox,
                        Text(
                          type.text,
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            AppLayout.paddingSmall.heightBox,
            Center(
              child: CusAnimatedSwitch(
                width: width * 0.3,
                items: _timeType,
                active: _activeType,
                onChanged: (value) {
                  setState(() {
                    _activeType = value;
                  });
                },
              ),
            ),
            AppLayout.paddingSmall.heightBox,
            CusDatePicker(),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              reverseDuration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _activeType == "Days"
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        AppLayout.paddingSmall.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: CusLabelTextfile(
                                label: "Form",
                                hintText: "9:00 AM",
                              ),
                            ),
                            AppLayout.paddingSmall.widthBox,
                            Expanded(
                              child: CusLabelTextfile(
                                label: "To",
                                hintText: "1:00 PM",
                              ),
                            ),
                          ],
                        ),
                        AppLayout.paddingSmall.heightBox,
                        Container(
                          padding: AppLayout.paddingSmall.allPadding,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundColor,
                            borderRadius: BorderRadius.circular(
                              AppLayout.borderRadius,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Time for Vacation"),
                              Text(
                                "4h 0m",
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).displayMedium?.fontSize,
                                  color: Color(0xff15C0E6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            Spacer(),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save Request",
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

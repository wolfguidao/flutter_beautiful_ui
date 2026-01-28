import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_widget.dart';
import 'package:flutter/material.dart';

class RequestEvent extends StatefulWidget {
  final double width;
  const RequestEvent({super.key, required this.width});

  @override
  State<RequestEvent> createState() => _RequestEventState();
}

class _RequestEventState extends State<RequestEvent> {
  bool _isRequestEvent = false;
  final List<String> _offsent = ["Daily", "Weekly", "Monthly"];
  String _selectedOffsent = "Daily";
  final List<String> _days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final Set<String> _selectedDays = {"Tue", "Fri"};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.paddingSmall,
            vertical: AppLayout.paddingSmall / 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            color: AppColor.backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Request Event"),
              Transform.scale(
                scale: 0.75,
                child: Switch(
                  value: _isRequestEvent,
                  onChanged: (value) {
                    setState(() {
                      _isRequestEvent = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
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
          child: _isRequestEvent
              ? Column(
                  children: [
                    AppLayout.paddingMedium.heightBox,
                    CusLabelWidget(
                      label: "Complete This Task",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _offsent.map((value) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOffsent = value;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppLayout.paddingLarge * 2,
                                vertical: AppLayout.paddingSmall * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color: value == _selectedOffsent
                                    ? AppColor.primaryColor
                                    : Colors.white,
                                border: Border.all(
                                  color: value == _selectedOffsent
                                      ? AppColor.primaryColor
                                      : AppColor.borderColor,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: value == _selectedOffsent
                                        ? Colors.white
                                        : const Color(0xff7D8592),
                                    fontSize: TextTheme.of(
                                      context,
                                    ).labelMedium?.fontSize,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    AppLayout.paddingMedium.heightBox,
                    CusLabelWidget(
                      label: "Complete This Task",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _days.map((value) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_selectedDays.contains(value)) {
                                  _selectedDays.remove(value);
                                } else {
                                  _selectedDays.add(value);
                                }
                              });
                            },
                            child: Container(
                              width: widget.width * 0.4 / 9,
                              padding: EdgeInsets.symmetric(
                                vertical: AppLayout.paddingSmall * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color: _selectedDays.contains(value)
                                    ? AppColor.primaryColor
                                    : AppColor.backgroundColor,
                                border: Border.all(
                                  color: _selectedDays.contains(value)
                                      ? AppColor.primaryColor
                                      : AppColor.borderColor,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: _selectedDays.contains(value)
                                        ? Colors.white
                                        : const Color(0xff7D8592),
                                    fontSize: TextTheme.of(
                                      context,
                                    ).labelMedium?.fontSize,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    AppLayout.paddingMedium.heightBox,
                    const CusLabelTextfile(
                      label: "Time",
                      hintText: "Select Time",
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}

import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_checkbox.dart';
import 'package:flutter/material.dart';

class NotificationsSetting extends StatefulWidget {
  const NotificationsSetting({super.key});

  @override
  State<NotificationsSetting> createState() => _NotificationsSettingState();
}

class _NotificationsSettingState extends State<NotificationsSetting> {
  final Map<String, String> _notificationType = {
    "Issue Activity": "Send me email notifications for issue activity",
    "Tracking Activity":
        "Send me notifications when someone’ve tracked time in tasks",
    "New Comments": "Send me notifications when someone’ve sent the comment",
  };

  List<bool> _activeList = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppLayout.paddingLarge.allPadding,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Notifications", style: TextTheme.of(context).displaySmall),
          AppLayout.paddingLarge.heightBox,
          ...List.generate(_notificationType.length, (index) {
            final String key = _notificationType.keys.toList()[index];
            return Container(
              margin: EdgeInsets.only(bottom: AppLayout.paddingMedium),
              padding: AppLayout.paddingSmall.allPadding,
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(key),
                        Text(
                          _notificationType[key] ?? "",
                          style: TextTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 0.75,
                    child: Switch(
                      value: _activeList[index],
                      onChanged: (value) {
                        setState(() {
                          _activeList[index]=value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          Row(
            children: [
              CusCheckbox(value: true, onChanged: (value) {}),
              AppLayout.paddingSmall.widthBox,
              Text(
                "Don't send me notifications after 9:00 PM",
                style: TextTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

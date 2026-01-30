import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/profile/component/notifications_setting.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_navigation.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  final VoidCallback onBack;
  const ProfileSetting({super.key, required this.onBack});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final List<CusNavigationItem> _navigationItem = [
    CusNavigationItem(text: "Account", icon: Assets.images.account),
    CusNavigationItem(text: "Notifications", icon: Assets.images.notification),
    CusNavigationItem(text: "My Company", icon: Assets.images.company),
    CusNavigationItem(text: "Connected Apps", icon: Assets.images.apps),
    CusNavigationItem(
      text: "Confidentiality",
      icon: Assets.images.confidentiality,
    ),
    CusNavigationItem(text: "Safety", icon: Assets.images.safety),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            GestureDetector(
              onTap: ()=>widget.onBack(),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 15,
                    color: AppColor.primaryColor,
                  ),
                  AppLayout.paddingSmall.widthBox,
                  Text("Settings", style: TextTheme.of(context).displaySmall),
                ],
              ),
            ),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: width * 0.25,
                    padding: AppLayout.paddingSmall.allPadding,
                    decoration: BoxDecoration(
                      color: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                    ),
                    child: CusNavigation(
                      items: _navigationItem,
                      activeIndex: 2,
                      onChanged: (index) {},
                    ),
                  ),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(child: NotificationsSetting()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

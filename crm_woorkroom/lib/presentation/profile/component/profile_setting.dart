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

class _ProfileSettingState extends State<ProfileSetting>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
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
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
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
        final double width = constraints.maxWidth;
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(20.0 * (1 - _animation.value), 0),
              child: Opacity(opacity: _animation.value, child: child),
            );
          },
          child: Column(
            children: [
              GestureDetector(
                onTap: () => widget.onBack(),
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
          ),
        );
      },
    );
  }
}

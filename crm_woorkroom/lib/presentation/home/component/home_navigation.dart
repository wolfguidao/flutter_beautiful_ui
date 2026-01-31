import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/home/widgets/support_dialog.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeNavigation extends StatelessWidget {
  final ValueChanged<int> onChanged;
  const HomeNavigation({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final List<CusNavigationItem> navigationItem = [
      CusNavigationItem(text: "Dashboard", icon: Assets.images.dashboard),
      CusNavigationItem(text: "Projects", icon: Assets.images.projects),
      CusNavigationItem(text: "Calendar", icon: Assets.images.calendar),
      CusNavigationItem(text: "Vacations", icon: Assets.images.vacations),
      CusNavigationItem(text: "Employees", icon: Assets.images.employees),
      CusNavigationItem(text: "Messenger", icon: Assets.images.messenger),
      CusNavigationItem(text: "Info Protal", icon: Assets.images.portal),
    ];

    void openSupportDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return SupportDialog();
        },
      );
    }

    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        color: AppColor.secondColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppLayout.paddingLarge.allPadding,
            child: SvgPicture.asset(Assets.images.logoBlue, width: 35),
          ),
          Expanded(
            child: CusNavigation(
              items: navigationItem,
              activeIndex: 0,
              onChanged: (int value) => onChanged(value),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.none,
              padding: AppLayout.paddingMedium.allPadding,
              decoration: BoxDecoration(
                color: Color(0xffECF3FF),
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Stack(
                alignment: AlignmentGeometry.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -40,
                    child: SvgPicture.asset(Assets.images.navIllus, width: 100),
                  ),
                  TextButton(
                    onPressed: () => openSupportDialog(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images.messenger,
                          colorFilter: ColorFilter.mode(
                            AppColor.secondColor,
                            BlendMode.srcIn,
                          ),
                          width: 15,
                        ),
                        AppLayout.paddingSmall.widthBox,
                        Text(
                          "Support",
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: AppLayout.paddingSmall.allPadding,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColor.secondColor,
                foregroundColor: AppColor.hintColor,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.logout),
                  AppLayout.paddingSmall.widthBox,
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

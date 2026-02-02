import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/home/dialog/notification_bar.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback toProfile;
  const HomeHeader({super.key, required this.toProfile});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: width * 0.175,
          child: TextField(
            style: TextTheme.of(context).bodyMedium,
            decoration: InputDecoration(hintText: "Search"),
          ),
        ),
        Spacer(),
        NotificationButton(),
        AppLayout.paddingMedium.widthBox,
        GestureDetector(
          onTap: () => toProfile(),
          child: Container(
            width: width * 0.12,
            padding: (AppLayout.paddingSmall * 0.8).allPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              color: AppColor.secondColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(Assets.images.avatar.path, width: 20),
                ),
                Expanded(
                  child: Padding(
                    padding: (AppLayout.paddingSmall * 0.4).horizontalPadding,
                    child: Text(
                      AppMock.user.name,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: TextTheme.of(context).labelMedium?.fontSize,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

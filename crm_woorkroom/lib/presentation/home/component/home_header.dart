import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
        IconButton(
          style: IconButton.styleFrom(
            minimumSize: Size(35, 35),
            maximumSize: Size(35, 35),
            backgroundColor: AppColor.secondColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppLayout.borderRadius),
            ),
          ),
          onPressed: () {},
          icon: Icon(Icons.notifications_on_outlined, size: 18),
        ),
        AppLayout.paddingMedium.widthBox,
        Container(
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
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    "Evan Yates",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.keyboard_arrow_down, size: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

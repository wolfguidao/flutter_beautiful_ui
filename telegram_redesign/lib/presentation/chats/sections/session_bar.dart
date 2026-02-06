import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/gen/assets.gen.dart';
import 'package:telegram_redesign/mock/mock_data.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class SessionBar extends StatefulWidget {
  const SessionBar({super.key});

  @override
  State<SessionBar> createState() => _SessionBarState();
}

class _SessionBarState extends State<SessionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppLayout.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(AppLayout.borderRadius * 10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: AppLayout.paddingLarge),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: AppColors.backgroundColor,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search",
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25 * 3,
            height: 50,
            child: Stack(
              children: List.generate(MockData.messages.take(3).length, (
                index,
              ) {
                return Positioned(
                  top: 0,
                  bottom: 0,
                  right: index * 20,
                  child: CusCircleAvatar(
                    avatar: Assets.images.avatar.path,
                    showStatus: false,
                    showProgress: true,
                    size: 25,
                  ),
                );
              }),
            ),
          ),
          AppLayout.paddingLarge.widthBox,
        ],
      ),
    );
  }
}

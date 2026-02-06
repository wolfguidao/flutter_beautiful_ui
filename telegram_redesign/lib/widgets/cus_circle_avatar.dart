import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/widgets/cus_circle_progress.dart';

class CusCircleAvatar extends StatelessWidget {
  final String avatar;
  final double size;
  final SessionStatus sessionStatus;
  final bool showStatus;
  final bool showProgress;
  final double progressValue;
  const CusCircleAvatar({
    super.key,
    required this.avatar,
    this.size = 40,
    this.showProgress = false,
    this.progressValue = 1,
    this.sessionStatus = SessionStatus.active,
    this.showStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        if (showProgress)
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.circle,
              ),
              child: CusCircleProgress(
                size: size + AppLayout.paddingSmall / 2,
                value: progressValue,
              ),
            ),
          ),
        ClipOval(
          child: Image.asset(
            avatar,
            fit: BoxFit.fill,
            width: size,
            height: size,
          ),
        ),
        if (sessionStatus == SessionStatus.active && showStatus)
          Positioned(
            right: -5,
            bottom: -2,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Color(0xff66CC53),
                border: Border.all(color: AppColors.backgroundColor, width: 2),
                shape: BoxShape.circle,
              ),
            ),
          ),
        if (sessionStatus == SessionStatus.isCalling && showStatus)
          Positioned(
            right: -5,
            bottom: -2,
            child: Container(
              width: 17,
              height: 17,
              padding: 1.allPadding,
              decoration: BoxDecoration(
                color: Color(0xff66CC53),
                border: Border.all(color: Colors.white, width: 1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.graphic_eq_rounded,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
        if (sessionStatus == SessionStatus.isVideo && showStatus)
          Positioned(
            right: -5,
            bottom: -2,
            child: Container(
              width: 17,
              height: 17,
              padding: 1.allPadding,
              decoration: BoxDecoration(
                color: Color(0xff66CC53),
                border: Border.all(color: Colors.white, width: 1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.video_call_outlined,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

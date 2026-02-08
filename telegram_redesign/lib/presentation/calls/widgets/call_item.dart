import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/call.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class CallItem extends StatefulWidget {
  final Call call;
  const CallItem({super.key, required this.call});

  @override
  State<CallItem> createState() => _CallItemState();
}

class _CallItemState extends State<CallItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CusCircleAvatar(avatar: widget.call.user.avatar, showStatus: false),
        Expanded(
          child: Container(
            margin: AppLayout.paddingSmall.horizontalPadding,
            padding: (AppLayout.paddingSmall / 2).verticalPadding,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.borderColor)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.call.user.nickname),
                      Row(
                        children: [
                          widget.call.status == CallStatus.answered
                              ? Icon(
                                  Icons.call_made,
                                  color: Color(0xff66CC53),
                                  size: context.iconSize,
                                )
                              : Icon(
                                  Icons.call_received,
                                  color: Color(0xffEB4E3D),
                                  size: context.iconSize,
                                ),
                          Text(
                            widget.call.time.enTimeByNow,
                            style: context.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                widget.call.type == CallType.voice
                    ? Icon(Icons.phone, color: AppColors.primaryColor)
                    : Icon(Icons.video_call, color: AppColors.primaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

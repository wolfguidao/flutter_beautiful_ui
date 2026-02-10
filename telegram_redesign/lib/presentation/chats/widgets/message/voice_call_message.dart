import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';

class VoiceCallMessage extends StatelessWidget {
  final Message message;
  const VoiceCallMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.content, style: context.textTheme.bodySmall),
            Row(
              children: [
                Icon(
                  Icons.call_made,
                  color: Color(0xff66CC53),
                  size: context.iconSize * 0.75,
                ),
                (AppLayout.paddingSmall / 2).widthBox,
                Text(
                  message.timestamp.enTimeByNow,
                  style: TextStyle(
                    fontSize: context.textTheme.labelSmall?.fontSize,
                  ),
                ),
              ],
            ),
          ],
        ),
        AppLayout.paddingLarge.widthBox,
        Icon(
          Icons.phone,
          color: message.isMe ? Colors.white : AppColors.primaryColor,
        ),
      ],
    );
  }
}

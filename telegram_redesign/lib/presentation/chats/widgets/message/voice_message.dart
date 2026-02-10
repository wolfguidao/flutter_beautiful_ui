import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';

class VoiceMessage extends StatefulWidget {
  final Message message;
  const VoiceMessage({super.key, required this.message});

  @override
  State<VoiceMessage> createState() => _VoiceMessageState();
}

class _VoiceMessageState extends State<VoiceMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primaryColor,
          ),
          onPressed: () {},
          icon: Icon(Icons.pause_circle_filled),
        ),
        AppLayout.paddingSmall.widthBox,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.message.durationString,
                style: context.textTheme.bodySmall,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.message.timestamp.enTimeByNow,
                    style: TextStyle(
                      fontSize: context.textTheme.labelSmall?.fontSize,
                    ),
                  ),
                  if (widget.message.isMe)
                    Padding(
                      padding: (AppLayout.paddingSmall / 2).horizontalPadding,
                      child: Icon(
                        Icons.done_all,
                        color: Colors.white,
                        size: context.iconSize * 0.75,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

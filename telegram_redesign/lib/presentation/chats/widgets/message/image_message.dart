import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';

class ImageMessage extends StatefulWidget {
  final Message message;
  const ImageMessage({super.key, required this.message});

  @override
  State<ImageMessage> createState() => _ImageMessageState();
}

class _ImageMessageState extends State<ImageMessage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          child: Image.network(widget.message.mediaUrl ?? ""),
        ),
        Container(
          padding: (AppLayout.paddingSmall * 0.2).allPadding,
          margin: (AppLayout.paddingSmall * 0.2).allPadding,
          decoration: BoxDecoration(
            color: AppColors.otherBubbleColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Row(
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
        ),
      ],
    );
  }
}

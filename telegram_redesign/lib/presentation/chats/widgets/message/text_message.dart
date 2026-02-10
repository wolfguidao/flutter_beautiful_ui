import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';

class TextMessage extends StatelessWidget {
  final Message message;
  const TextMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("${message.text}", style: context.textTheme.bodySmall),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.timestamp.enTimeByNow,
              style: TextStyle(
                fontSize: context.textTheme.labelSmall?.fontSize,
              ),
            ),
            if (message.isMe)
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
    );
  }
}

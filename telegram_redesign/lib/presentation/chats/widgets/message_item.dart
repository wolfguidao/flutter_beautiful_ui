import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/file_message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/image_message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/link_message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/text_message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/video_call_message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/voice_call_message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message/voice_message.dart';

class MessageItem extends StatefulWidget {
  final Message message;
  const MessageItem({super.key, required this.message});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppLayout.paddingSmall.horizontalPadding,
      child: Align(
        alignment: widget.message.isMe
            ? AlignmentGeometry.centerRight
            : AlignmentGeometry.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: context.screenWidth * 0.65),
          padding: (AppLayout.paddingSmall / 2).allPadding,
          margin: (AppLayout.paddingSmall / 2).verticalPadding,
          decoration: BoxDecoration(
            color: widget.message.isMe
                ? AppColors.meBubbleColor
                : AppColors.otherBubbleColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: switch (widget.message.type) {
            MessageType.text => TextMessage(message: widget.message),
            MessageType.videoCall => VideoCallMessage(message: widget.message),
            MessageType.voiceCall => VoiceCallMessage(message: widget.message),
            MessageType.image => ImageMessage(message: widget.message),
            MessageType.file => FileMessage(message: widget.message),
            MessageType.voice => VoiceMessage(message: widget.message),
            MessageType.link => LinkMessage(message: widget.message),
            _ => Text(widget.message.content),
          },
        ),
      ),
    );
  }
}

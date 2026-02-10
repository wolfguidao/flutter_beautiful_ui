import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';

class MessageInputPanel extends StatefulWidget {
  const MessageInputPanel({super.key});

  @override
  State<MessageInputPanel> createState() => _MessageInputPanelState();
}

class _MessageInputPanelState extends State<MessageInputPanel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.only(bottom: AppLayout.paddingSmall),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: AppLayout.paddingSmall.horizontalPadding,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(
                    AppLayout.borderRadius * 10,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor,
                        foregroundColor: AppColors.hintTextColor,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.emoji_emotions_outlined),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: AppColors.backgroundColor,
                          hintText: "Message",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor,
                        foregroundColor: AppColors.hintTextColor,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.link),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.backgroundColor,
                foregroundColor: AppColors.hintTextColor,
              ),
              onPressed: () {},
              icon: Icon(Icons.keyboard_voice_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

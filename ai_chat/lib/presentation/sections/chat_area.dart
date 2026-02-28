import 'package:ai_chat/constant/app_extension.dart';
import 'package:ai_chat/constant/app_style.dart';
import 'package:flutter/material.dart';

class ChatArea extends StatefulWidget {
  const ChatArea({super.key});

  @override
  State<ChatArea> createState() => _ChatAreaState();
}

class _ChatAreaState extends State<ChatArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
            height: context.height * 0.075,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              border: Border(bottom: BorderSide(color: AppColor.borderColor)),
            ),
          ),
        ],
      ),
    );
  }
}

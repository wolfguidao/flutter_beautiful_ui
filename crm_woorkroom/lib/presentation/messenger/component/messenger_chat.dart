import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/session.dart';
import 'package:flutter/material.dart';

class MessengerChat extends StatefulWidget {
  final Conversation conversation;
  const MessengerChat({super.key, required this.conversation});

  @override
  State<MessengerChat> createState() => _MessengerChatState();
}

class _MessengerChatState extends State<MessengerChat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          padding: AppLayout.paddingSmall.allPadding,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColor.borderColor)),
          ),
          child: Row(children: [

            ],
          ),
        ),
      ],
    );
  }
}

import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/session.dart';
import 'package:crm_woorkroom/presentation/messenger/component/messenger_chat.dart';
import 'package:crm_woorkroom/presentation/messenger/component/messenger_session_bar.dart';
import 'package:flutter/material.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  State<MessengerPage> createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {
  Conversation? _conversation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Messenger", style: TextTheme.of(context).displayLarge),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                ),
                child: Row(
                  children: [
                    MessengerSessionBar(
                      width: width,
                      onTap: (Conversation value) {
                        setState(() {
                          _conversation=value;
                        });
                      },
                    ),
                    Expanded(
                      child: _conversation == null
                          ? SizedBox.shrink()
                          : MessengerChat(conversation: _conversation!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

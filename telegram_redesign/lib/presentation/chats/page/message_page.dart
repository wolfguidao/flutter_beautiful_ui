import 'package:flutter/material.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/mock/mock_data.dart';
import 'package:telegram_redesign/presentation/chats/sections/message_bar.dart';
import 'package:telegram_redesign/presentation/chats/sections/message_input_panel.dart';
import 'package:telegram_redesign/presentation/chats/widgets/message_item.dart';

class MessagePage extends StatefulWidget {
  final Session session;
  const MessagePage({super.key, required this.session});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MessageBar(session: widget.session),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: MockData.messages.length,
              itemBuilder: (context, index) {
                final message = MockData.messages.reversed.toList()[index];
                return MessageItem(message: message);
              },
            ),
          ),
          MessageInputPanel(),
        ],
      ),
    );
  }
}

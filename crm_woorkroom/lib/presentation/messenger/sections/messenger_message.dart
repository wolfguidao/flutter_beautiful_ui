import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/message.dart';
import 'package:crm_woorkroom/entity/conversation.dart';
import 'package:crm_woorkroom/presentation/messenger/sections/chat_input_area.dart';
import 'package:crm_woorkroom/presentation/messenger/widgets/message_item.dart';
import 'package:crm_woorkroom/presentation/messenger/widgets/message_search_input.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_delay_item.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class MessengerMessage extends StatefulWidget {
  final Conversation conversation;
  final VoidCallback onDetail;
  const MessengerMessage({
    super.key,
    required this.conversation,
    required this.onDetail,
  });

  @override
  State<MessengerMessage> createState() => _MessengerMessageState();
}

class _MessengerMessageState extends State<MessengerMessage> {
  Message? _focusMessage;
  bool _showSearch = false;

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
          child: Row(
            children: [
              ClipOval(
                child: CusCircleAvatar(
                  avatar: widget.conversation.avatar,
                  size: 30,
                ),
              ),
              AppLayout.paddingSmall.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.conversation.name),
                  Text(
                    "${widget.conversation.members.length} members",
                    style: TextTheme.of(context).labelSmall,
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.backgroundColor,
                ),
                onPressed: () {
                  setState(() {
                    _showSearch = true;
                  });
                },
                icon: Icon(Icons.search, size: 20),
              ),
              AppLayout.paddingSmall.widthBox,
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.backgroundColor,
                ),
                onPressed: () {},
                icon: Icon(Icons.pin_end, size: 20),
              ),
              AppLayout.paddingSmall.widthBox,
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.backgroundColor,
                ),
                onPressed: () => widget.onDetail(),
                icon: Icon(Icons.more_vert_outlined, size: 20),
              ),
            ],
          ),
        ),
        if (_showSearch)
          MessageSearchInput(
            onClose: () {
              setState(() {
                _showSearch = false;
              });
            },
          ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColor.secondColor,
                  toolbarHeight: 40,
                  title: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingSmall,
                      vertical: AppLayout.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                      border: Border.all(color: AppColor.borderColor),
                    ),
                    child: Text(
                      DateTime.now().fullDate,
                      style: TextTheme.of(context).labelSmall,
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: AppMock.messageList.length,
                  itemBuilder: (context, index) {
                    final Message message = AppMock.messageList[index];
                    return CusAnimatedDelayItem(
                      index: index,
                      child: MessageItem(
                        message: message,
                        isFocus: message == _focusMessage,
                        onFocus: (value) {
                          setState(() {
                            _focusMessage = value;
                          });
                        },
                        onCancelFocus: () {
                          setState(() {
                            _focusMessage = null;
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        ChatInputArea(),
      ],
    );
  }
}

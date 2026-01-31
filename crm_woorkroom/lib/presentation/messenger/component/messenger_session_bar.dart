import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/session.dart';
import 'package:crm_woorkroom/presentation/messenger/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class MessengerSessionBar extends StatefulWidget {
  final double width;
  final ValueChanged<Conversation> onTap;
  const MessengerSessionBar({
    super.key,
    required this.width,
    required this.onTap,
  });

  @override
  State<MessengerSessionBar> createState() => _MessengerSessionBarState();
}

class _MessengerSessionBarState extends State<MessengerSessionBar> {
  late List<Conversation> _groupList;
  late List<Conversation> _directList;
  int _activeId = 0;

  @override
  void initState() {
    _groupList = AppMock.sessionList
        .where((e) => e.sessionType == SessionType.groups)
        .toList();
    _directList = AppMock.sessionList
        .where((e) => e.sessionType == SessionType.direct)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: AppColor.borderColor)),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: AppLayout.paddingSmall.allPadding,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.borderColor)),
            ),
            child: Row(
              children: [
                Text("Conversations"),
                Spacer(),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 15),
                ),
                AppLayout.paddingSmall.widthBox,
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: AppColor.secondColor,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add, size: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColor.secondColor,
                  titleSpacing: AppLayout.paddingSmall,
                  toolbarHeight: 30,
                  title: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                        Text(
                          "Groups",
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: _groupList.length,
                  itemBuilder: (context, index) {
                    final Conversation conversation = _groupList[index];
                    return ConversationItem(
                      conversation: conversation,
                      isAcative: _activeId == conversation.id,
                      onTap: (value) {
                        setState(() {
                          _activeId = value;
                          widget.onTap(conversation);
                        });
                      },
                    );
                  },
                ),
                SliverAppBar(
                  backgroundColor: AppColor.secondColor,
                  titleSpacing: AppLayout.paddingSmall,
                  toolbarHeight: 30,
                  title: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 15,
                          color: AppColor.primaryColor,
                        ),
                        Text(
                          "Direct Message",
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: _directList.length,
                  itemBuilder: (context, index) {
                    final Conversation conversation = _directList[index];
                    return ConversationItem(
                      conversation: conversation,
                      isAcative: _activeId == conversation.id,
                      onTap: (value) {
                        setState(() {
                          _activeId = value;
                          widget.onTap(conversation);
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

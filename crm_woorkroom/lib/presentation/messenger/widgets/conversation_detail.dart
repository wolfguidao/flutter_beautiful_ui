import 'package:crm_woorkroom/constant/app_enum.dart';
import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/conversation.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class ConversationDetail extends StatefulWidget {
  final Conversation conversation;
  final VoidCallback onClose;
  const ConversationDetail({
    super.key,
    required this.conversation,
    required this.onClose,
  });

  @override
  State<ConversationDetail> createState() => _ConversationDetailState();
}

class _ConversationDetailState extends State<ConversationDetail>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: AppColor.borderColor)),
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
                Text("Details"),
                Spacer(),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                  ),
                  onPressed: () => widget.onClose(),
                  icon: Icon(Icons.close, size: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 0.1),
                end: Offset.zero,
              ).animate(_controller),
              child: Column(
                children: [
                  AppLayout.paddingSmall.heightBox,
                  CusCircleAvatar(avatar: widget.conversation.avatar, size: 60),
                  Padding(
                    padding: AppLayout.paddingSmall.verticalPadding,
                    child: Text(widget.conversation.name),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColor.backgroundColor,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.search, size: 15),
                      ),
                      Padding(
                        padding: AppLayout.paddingSmall.horizontalPadding,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColor.backgroundColor,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.people, size: 15),
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColor.backgroundColor,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined, size: 15),
                      ),
                    ],
                  ),
                  Divider(color: AppColor.borderColor),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(
                        context,
                      ).copyWith(scrollbars: false),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: _ConversationExpansionTile(
                              title: "Info",
                              icon: Icon(Icons.info_outline, size: 20),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: _ConversationExpansionTile(
                              title: "Members",
                              icon: Icon(Icons.group_outlined, size: 20),
                              children: widget.conversation.members.map((
                                member,
                              ) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: AppLayout.paddingSmall,
                                  ),
                                  child: Row(
                                    children: [
                                      CusCircleAvatar(
                                        avatar: member.avatar,
                                        size: 20,
                                      ),
                                      AppLayout.paddingSmall.widthBox,
                                      Text(member.name),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: _ConversationExpansionTile(
                              title: "Media",
                              icon: Icon(Icons.image_outlined, size: 20),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: _ConversationExpansionTile(
                              title: "Files",
                              icon: Icon(Icons.attach_file_outlined, size: 20),
                              children: AppMock.messageList
                                  .where((e) => e.type != MessageType.text)
                                  .map((message) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        bottom: AppLayout.paddingSmall,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.borderColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          AppLayout.borderRadius,
                                        ),
                                      ),
                                      padding:
                                          AppLayout.paddingSmall.allPadding,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding:
                                                (AppLayout.paddingSmall / 2)
                                                    .allPadding,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF1EFFB),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppLayout.borderRadius,
                                                  ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.image_outlined,
                                                color: Color(0xff6D5DD3),
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          AppLayout.paddingSmall.widthBox,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  message.fileName ?? "",
                                                  style: TextStyle(
                                                    fontSize: TextTheme.of(
                                                      context,
                                                    ).labelMedium?.fontSize,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  message.fileSize ?? "",
                                                  style: TextTheme.of(
                                                    context,
                                                  ).labelSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                                  .toList(),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: _ConversationExpansionTile(
                              title: "Links",
                              icon: Icon(Icons.link_outlined, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversationExpansionTile extends StatelessWidget {
  final List<Widget>? children;
  final String title;
  final Widget icon;
  const _ConversationExpansionTile({
    this.children,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(side: BorderSide.none),
      splashColor: Colors.transparent,
      iconColor: Colors.black,
      minTileHeight: 30,
      title: Row(
        children: [
          icon,
          (AppLayout.paddingSmall / 2).widthBox,
          Text(
            title,
            style: TextStyle(
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      tilePadding: AppLayout.paddingSmall.horizontalPadding,
      childrenPadding: AppLayout.paddingSmall.horizontalPadding,
      children: children ?? [],
    );
  }
}

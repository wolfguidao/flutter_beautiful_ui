import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/mock/mock_data.dart';
import 'package:telegram_redesign/widgets/cus_calls_floating.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class SessionItem extends StatefulWidget {
  final Session session;
  const SessionItem({super.key, required this.session});

  @override
  State<SessionItem> createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem>
    with SingleTickerProviderStateMixin {
  double _dragExtent = 0;
  final double _maxActionWidth = 80;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
          upperBound: _maxActionWidth,
          lowerBound: -_maxActionWidth,
        )..addListener(() {
          setState(() {
            _dragExtent = _controller.value;
          });
        });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _controller.value += details.primaryDelta!;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (_controller.value < -_maxActionWidth * 0.5) {
      _controller.animateTo(-_maxActionWidth, curve: Curves.easeOut);
    } else if (_controller.value > _maxActionWidth * 0.5) {
      _controller.animateTo(_maxActionWidth, curve: Curves.easeOut);
    } else {
      _controller.animateTo(0, curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double rightProgress = (_dragExtent / -_maxActionWidth).clamp(
      0.0,
      1.0,
    );
    final double leftProgress = (_dragExtent / _maxActionWidth).clamp(0.0, 1.0);
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SessionAction(
              backgroundColor: Color(0xff8C63E5),
              progress: leftProgress,
              iconData: Icons.volume_down_outlined,
              text: "Mute",
              onTap: () {
                _controller.animateTo(0, curve: Curves.easeOut).then((_) {
                  CallsTools.show(MockData.sessions[0]);
                });
              },
            ),
            SessionAction(
              backgroundColor: Color(0xff2F3D43),
              progress: rightProgress,
              iconData: Icons.archive_outlined,
              text: "Archive",
              onTap: () {},
            ),
          ],
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) => _onHorizontalDragUpdate(details),
          onHorizontalDragEnd: (details) => _onHorizontalDragEnd(details),
          onTap: () {
            context.push('/message', extra: widget.session);
          },
          child: Transform.translate(
            offset: Offset(_dragExtent, 0),
            child: SessionContent(session: widget.session),
          ),
        ),
      ],
    );
  }
}

class SessionAction extends StatelessWidget {
  final double progress;
  final IconData iconData;
  final Color backgroundColor;
  final String text;
  final VoidCallback onTap;
  const SessionAction({
    super.key,
    required this.progress,
    required this.iconData,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: progress,
      child: Container(
        width: context.screenWidth * 0.175,
        height: context.screenHeight * 0.075,
        decoration: BoxDecoration(color: backgroundColor),
        child: IconButton(
          onPressed: () => onTap(),
          icon: Column(
            children: [
              Icon(iconData, color: Colors.white),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.textTheme.labelMedium?.fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SessionContent extends StatelessWidget {
  final Session session;
  const SessionContent({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.075,
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Row(
        children: [
          CusCircleAvatar(
            sessionStatus: session.status,
            avatar: session.avatar,
            showProgress: true,
          ),
          AppLayout.paddingSmall.widthBox,
          Expanded(
            child: Container(
              padding: (AppLayout.paddingSmall / 2).verticalPadding,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.borderColor),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          session.name,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      if (session.latestMessage != null &&
                          session.latestMessage!.isMe)
                        Padding(
                          padding: AppLayout.paddingSmall.horizontalPadding,
                          child: Icon(
                            Icons.done_all_rounded,
                            color: Color(0xff66CC53),
                            size: context.iconSize,
                          ),
                        ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          session.latestMessage == null
                              ? ""
                              : session.latestMessage!.timestamp.enTimeByNow,
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  (AppLayout.paddingSmall / 2).heightBox,
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          session.latestMessage == null
                              ? "No Message"
                              : session.latestMessage!.content,
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                      AppLayout.paddingSmall.widthBox,
                      if (session.unreadCount != 0 && !session.isPinned)
                        Container(
                          width: 22.5,
                          height: 22.5,
                          padding: (AppLayout.paddingSmall * 0.1).allPadding,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "${session.unreadCount}",
                              style: TextStyle(
                                fontSize:
                                    context.textTheme.labelMedium?.fontSize,
                              ),
                            ),
                          ),
                        ),
                      if (session.isPinned)
                        Icon(
                          Icons.push_pin_outlined,
                          color: AppColors.hintTextColor,
                          size: context.iconSize,
                        ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/message.dart';
import 'package:telegram_redesign/presentation/chats/widgets/context_menu_item.dart';

class MessageHoverTools extends StatefulWidget {
  final Message message;
  final Offset position;
  final Size size;
  final Widget messageWidget;

  const MessageHoverTools({
    super.key,
    required this.message,
    required this.position,
    required this.size,
    required this.messageWidget,
  });

  @override
  State<MessageHoverTools> createState() => _MessageHoverToolsState();
}

class _MessageHoverToolsState extends State<MessageHoverTools>
    with SingleTickerProviderStateMixin {
  final List<String> _emoji = ['👍', '👎', '❤️', '🧨', '🎉', '🎈', '🐷'];
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _controller.forward();
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    super.initState();
  }

  double _getTopOffset() {
    double offset = 0;
    double itemHeight = context.screenHeight * 0.05;
    double minOffset = MediaQuery.of(context).padding.top;
    double maxOffset =
        context.screenHeight - MediaQuery.of(context).padding.bottom;
    if (minOffset > widget.position.dy - itemHeight) {
      offset = minOffset + itemHeight;
    } else if (widget.position.dy + widget.size.height + 6 * itemHeight >
        maxOffset) {
      offset = maxOffset - widget.size.height - 6 * itemHeight;
    } else {
      offset = widget.position.dy;
    }
    return offset;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () async {
              await _controller.reverse();
              Navigator.pop(context);
            },
            child: Container(color: Colors.black.withAlpha(200)),
          ),
          Positioned(
            right: widget.message.isMe ? AppLayout.paddingSmall * 2 : 0,
            left: widget.message.isMe ? 0 : AppLayout.paddingSmall * 2,
            top: _getTopOffset(),
            child: Hero(tag: widget.message.id, child: widget.messageWidget),
          ),
          Positioned(
            right: widget.message.isMe ? AppLayout.paddingSmall * 2 : null,
            left: widget.message.isMe ? null : AppLayout.paddingSmall * 2,
            top: _getTopOffset() - context.screenHeight * 0.05,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -20 * (1 - _controller.value)),
                  child: Opacity(opacity: _controller.value, child: child),
                );
              },
              child: Container(
                height: context.screenHeight * 0.05,
                padding: (AppLayout.paddingSmall / 2).allPadding,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(
                    AppLayout.borderRadius * 10,
                  ),
                ),
                child: Row(
                  children: _emoji.map((value) {
                    return Padding(
                      padding: AppLayout.paddingSmall.horizontalPadding / 2,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: context.screenWidth * 0.05),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.message.isMe ? AppLayout.paddingSmall * 2 : null,
            left: widget.message.isMe ? null : AppLayout.paddingSmall * 2,
            top: _getTopOffset() + widget.size.height,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * (1 - _controller.value)),
                  child: Opacity(opacity: _animation.value, child: child),
                );
              },
              child: Container(
                width: context.screenWidth * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor.withAlpha(240),
                  borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  border: Border.all(color: AppColors.borderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ContextMenuItem(
                      onTap: () {},
                      icon: Icons.reply,
                      text: 'Reply',
                    ),
                    ContextMenuItem(
                      onTap: () {},
                      icon: Icons.copy,
                      text: 'Copy',
                    ),
                    ContextMenuItem(
                      onTap: () {},
                      icon: Icons.forward,
                      text: 'Forward',
                    ),
                    ContextMenuItem(
                      onTap: () {},
                      icon: Icons.push_pin,
                      text: 'Pin',
                    ),
                    ContextMenuItem(
                      onTap: () {},
                      icon: Icons.edit,
                      text: 'Edit',
                    ),
                    ContextMenuItem(
                      onTap: () {},
                      icon: Icons.delete,
                      text: 'Delete',
                      showBorder: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

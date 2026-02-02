import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/conversation.dart';
import 'package:crm_woorkroom/presentation/messenger/component/messenger_message.dart';
import 'package:crm_woorkroom/presentation/messenger/component/messenger_conversation_bar.dart';
import 'package:crm_woorkroom/presentation/messenger/widgets/conversation_detail.dart';
import 'package:flutter/material.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  State<MessengerPage> createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  Conversation? _conversation;
  bool _showDetail = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Messenger", style: TextTheme.of(context).displayLarge),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 20.0 * (1 - _animation.value)),
                    child: Opacity(opacity: _animation.value, child: child),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                  ),
                  child: Row(
                    children: [
                      MessengerConversationBar(
                        width: width,
                        onTap: (Conversation value) {
                          setState(() {
                            _conversation = value;
                          });
                        },
                      ),
                      Expanded(
                        child: _conversation == null
                            ? SizedBox.shrink()
                            : MessengerMessage(
                                conversation: _conversation!,
                                onDetail: () {
                                  setState(() {
                                    _showDetail = !_showDetail;
                                  });
                                },
                              ),
                      ),
                      if (_conversation != null && _showDetail)
                        ConversationDetail(
                          conversation: _conversation!,
                          onClose: () {
                            setState(() {
                              _showDetail = false;
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

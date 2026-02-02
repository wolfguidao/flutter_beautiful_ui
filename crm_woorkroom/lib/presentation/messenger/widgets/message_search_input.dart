import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class MessageSearchInput extends StatefulWidget {
  final VoidCallback onClose;
  const MessageSearchInput({super.key, required this.onClose});

  @override
  State<MessageSearchInput> createState() => _MessageSearchInputState();
}

class _MessageSearchInputState extends State<MessageSearchInput>
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
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, -0.2),
        end: Offset.zero,
      ).animate(_controller),
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColor.borderColor)),
          ),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 20)),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    fontSize: TextTheme.of(context).labelMedium?.fontSize,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.calendar_today_outlined, size: 20),
              ),
              IconButton(
                onPressed: () async {
                  await _controller.reverse();
                  widget.onClose();
                },
                icon: Icon(Icons.close, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

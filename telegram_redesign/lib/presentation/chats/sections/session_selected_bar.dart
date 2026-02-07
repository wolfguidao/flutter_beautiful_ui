import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_extension.dart';

class SessionSelectedBar extends StatefulWidget {
  final List<String> selectedSessionIds;
  final VoidCallback onClose;
  const SessionSelectedBar({
    super.key,
    required this.selectedSessionIds,
    required this.onClose,
  });

  @override
  State<SessionSelectedBar> createState() => _SessionSelectedBarState();
}

class _SessionSelectedBarState extends State<SessionSelectedBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _controller.forward();
    super.initState();
  }

  void _handleClose() {
    _controller.reverse().then((_) => widget.onClose());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.2),
          end: Offset.zero,
        ).animate(_controller),
        child: Row(
          children: [
            IconButton(onPressed: _handleClose, icon: Icon(Icons.close)),
            Expanded(
              child: Text(
                "${widget.selectedSessionIds.length}",
                style: context.textTheme.bodyMedium,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.volume_down_outlined),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.archive_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}

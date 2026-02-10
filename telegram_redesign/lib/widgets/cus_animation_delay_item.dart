import 'package:flutter/material.dart';

class CusAnimationDelayItem extends StatefulWidget {
  final int index;
  final int roundDelay;
  final Widget child;
  const CusAnimationDelayItem({
    super.key,
    required this.index,
    this.roundDelay = 10,
    required this.child,
  });

  @override
  State<CusAnimationDelayItem> createState() => _CusAnimationDelayItemState();
}

class _CusAnimationDelayItemState extends State<CusAnimationDelayItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    int delay = (widget.index % widget.roundDelay)*100;
    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) _controller.forward();
    });
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
        begin: Offset(0, 0.1),
        end: Offset.zero,
      ).animate(_controller),
      child: FadeTransition(opacity: _controller, child: widget.child),
    );
  }
}

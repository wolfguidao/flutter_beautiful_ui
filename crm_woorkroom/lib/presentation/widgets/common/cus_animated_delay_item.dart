import 'package:flutter/material.dart';

class CusAnimatedDelayItem extends StatefulWidget {
  final int index;
  final Widget child;
  final int roundDelay;
  const CusAnimatedDelayItem({
    super.key,
    required this.index,
    required this.child,
    this.roundDelay = 10,
  });

  @override
  State<CusAnimatedDelayItem> createState() => _CusAnimatedDelayItemState();
}

class _CusAnimatedDelayItemState extends State<CusAnimatedDelayItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    int delay = (widget.index % widget.roundDelay) * 100;
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20.0 * (1 - _animation.value)),
          child: Opacity(opacity: _animation.value, child: child),
        );
      },
      child: widget.child,
    );
  }
}

import 'package:flutter/material.dart';

class CusRippleWrapper extends StatelessWidget {
  final Widget child;
  final Color color;
  final double size;
  final int number;
  const CusRippleWrapper({
    super.key,
    required this.child,
    required this.color,
    required this.size,
    this.number = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        ...List.generate(number, (index) {
          return _Rippler(
            color: color,
            size: size,
            delay: 1 / (number) * index,
          );
        }),
        child,
      ],
    );
  }
}

class _Rippler extends StatefulWidget {
  final Color color;
  final double size;
  final double delay;
  const _Rippler({
    required this.color,
    required this.size,
    required this.delay,
  });

  @override
  State<_Rippler> createState() => __RipplerState();
}

class __RipplerState extends State<_Rippler>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward(from: widget.delay);
    _controller.repeat();
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
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: (_controller.value * 0.6) + 0.5,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color.withOpacity(1 - _controller.value * 0.8),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

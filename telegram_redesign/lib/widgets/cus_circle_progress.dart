import 'dart:math' as math;

import 'package:flutter/material.dart';

class CusCircleProgress extends StatelessWidget {
  final double size;
  final double value;
  const CusCircleProgress({super.key, required this.size, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: GridientArcPainter(
        progress: value,
        colors: [Color(0xff37C772), Color(0xff40A1FB)],
      ),
    );
  }
}

class GridientArcPainter extends CustomPainter {
  final double progress;
  final List<Color> colors;

  GridientArcPainter({
    super.repaint,
    required this.progress,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    paint.shader = SweepGradient(
      colors: colors,
      startAngle: 0.0,
      endAngle: math.pi * 2,
      transform: const GradientRotation(-math.pi / 2),
    ).createShader(rect);

    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi * 2 * progress;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

import 'package:flutter/material.dart';

class LightPainter extends CustomPainter {
  final double centerRate;
  final Color color;

  LightPainter({super.repaint, required this.color, required this.centerRate});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width * centerRate, size.height / 2),
        width: size.width / 2,
        height: size.width / 2,
      ),
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

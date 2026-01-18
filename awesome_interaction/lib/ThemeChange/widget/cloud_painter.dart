import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  final Color cloudColor;
  final Offset offset;

  CloudPainter({super.repaint, required this.cloudColor, required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint cloudPaint = Paint()
      ..color = cloudColor
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0 + offset.dx, height);

    path.quadraticBezierTo(
      width * 0.15 + offset.dx,
      height * 0.6 + offset.dy,
      width * 0.3 + offset.dx,
      height * 0.9 + offset.dy,
    );

    path.quadraticBezierTo(
      width * 0.4 + offset.dx,
      height * 0.75 + offset.dy,
      width * 0.5 + offset.dx,
      height * 0.85 + offset.dy,
    );

    path.quadraticBezierTo(
      width * 0.55 + offset.dx,
      height * 0.8 + offset.dy,
      width * 0.6 + offset.dx,
      height * 0.84 + offset.dy,
    );

    path.quadraticBezierTo(
      width * 0.7 + offset.dx,
      height * 0.6 + offset.dy,
      width * 0.85 + offset.dx,
      height * 0.75 + offset.dy,
    );

    path.quadraticBezierTo(
      width * 0.88 + offset.dx,
      height * 0.62 + offset.dy,
      width * 0.9 + offset.dx,
      height * 0.625 + offset.dy,
    );

    path.quadraticBezierTo(
      width * 0.775 + offset.dx,
      height * 0.4 + offset.dy,
      width * 0.9 + offset.dx,
      0 + offset.dy,
    );

    path.lineTo(width * 1.2 - offset.dx, height);
    path.close();

    canvas.drawPath(path, cloudPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

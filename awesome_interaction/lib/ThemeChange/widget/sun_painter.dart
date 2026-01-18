import 'package:flutter/material.dart';

class SunPainter extends CustomPainter {
  final Color sunColor;
  final LinearGradient sunShadowColor;

  SunPainter({
    super.repaint,
    required this.sunColor,
    required this.sunShadowColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    //Sun
    final Paint sunPaint = Paint()
      ..color = sunColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1);
    final Path sunPath = Path();
    sunPath.addOval(
      Rect.fromCircle(center: Offset(width / 2, height / 2), radius: width / 2),
    );

    //Sun Shadow
    final Paint sunShadowPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = sunShadowColor.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    final Path sunShadowPath = Path();
    sunShadowPath.addOval(
      Rect.fromCircle(
        center: Offset(width / 2 - 2, height / 2),
        radius: width / 2 + 3,
      ),
    );

    canvas.drawPath(sunShadowPath, sunShadowPaint);
    canvas.drawPath(sunPath, sunPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

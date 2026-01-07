import 'package:flutter/material.dart';

class BlurColorWidget extends StatelessWidget {
  final double size;
  final Color color;
  final double blurRadius;
  final double spreadRadius;

  const BlurColorWidget({
    super.key,
    required this.size,
    required this.color,
    this.blurRadius = 50,
    this.spreadRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
    );
  }
}

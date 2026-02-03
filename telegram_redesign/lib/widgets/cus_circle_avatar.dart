import 'package:flutter/material.dart';

class CusCircleAvatar extends StatelessWidget {
  final String avatr;
  final double size;
  const CusCircleAvatar({super.key, required this.avatr, this.size=30});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(avatr, fit: BoxFit.fill, width: size, height: size),
    );
  }
}

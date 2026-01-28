import 'package:flutter/material.dart';

class CusCircleAvatar extends StatelessWidget {
  final String avatar;
  final double size;
  const CusCircleAvatar({super.key, required this.avatar, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(avatar, width: size, height: size, fit: BoxFit.fill),
    );
  }
}

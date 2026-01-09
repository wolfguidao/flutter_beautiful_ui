import 'package:flutter/material.dart';

class CusLabelTextfield extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  const CusLabelTextfield({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: TextTheme.of(context).labelMedium),
      subtitle: TextField(
        style: TextTheme.of(context).bodySmall,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}

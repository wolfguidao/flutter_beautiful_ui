import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusLabelTextfile extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final int minLines;
  const CusLabelTextfile({
    super.key,
    required this.label,
    required this.hintText,
    this.isObscure = false,
    this.minLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextTheme.of(context).labelMedium),
        (AppLayout.paddingSmall * 0.5).heightBox,
        TextField(
          style: TextTheme.of(context).bodyMedium,
          obscureText: isObscure,
          minLines: minLines,
          maxLines: minLines,
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

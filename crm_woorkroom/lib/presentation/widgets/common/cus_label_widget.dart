import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusLabelWidget extends StatelessWidget {
  final String label;
  final Widget child;
  const CusLabelWidget({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextTheme.of(context).labelMedium),
        (AppLayout.paddingSmall * 0.5).heightBox,
        child,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';

class CusCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;
  final double size;
  const CusCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        padding: (AppLayout.paddingSmall / 2).allPadding,
        decoration: BoxDecoration(
          color: value ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: Colors.white, width: 1.5),
          shape: BoxShape.circle,
        ),
        child: value
            ? Center(
                child: Text(label, style: TextStyle(fontSize: size)),
              )
            : null,
      ),
    );
  }
}

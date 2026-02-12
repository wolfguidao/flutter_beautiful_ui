import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_layout.dart';

class ContextMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final bool showBorder;
  const ContextMenuItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.screenHeight * 0.05,
        padding: AppLayout.paddingSmall.allPadding,
        decoration: BoxDecoration(
          border: showBorder
              ? Border(bottom: BorderSide(color: AppColors.borderColor))
              : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.primaryColor),
            SizedBox(width: 12),
            Text(text, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

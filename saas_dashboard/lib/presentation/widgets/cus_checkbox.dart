import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';

class CusCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double radius;
  const CusCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.radius=4.0,
  });

  @override
  State<CusCheckbox> createState() => _CusCheckboxState();
}

class _CusCheckboxState extends State<CusCheckbox> {
  late bool _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.onChanged(_value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: _value ? AppColors.secondColor : Colors.transparent,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            color: _value ? AppColors.secondColor : const Color(0xffD1D1D6),
            width: 1.5,
          ),
        ),
        child: _value
            ? const Icon(Icons.check, size: 10, color: Colors.white)
            : null,
      ),
    );
  }
}

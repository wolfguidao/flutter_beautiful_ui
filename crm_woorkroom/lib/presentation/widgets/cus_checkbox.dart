import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  const CusCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 10,
  });

  @override
  State<CusCheckbox> createState() => _CusCheckboxState();
}

class _CusCheckboxState extends State<CusCheckbox> {
  late bool _isCheck;

  @override
  void initState() {
    _isCheck = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCheck = !_isCheck;
        });
        widget.onChanged(_isCheck);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColor.textColor, width: 1.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Icon(
            Icons.done,
            size: widget.size,
            color: _isCheck ? AppColor.primaryColor : Colors.transparent,
          ),
        ),
      ),
    );
  }
}

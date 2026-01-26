import 'package:flutter/material.dart';

class CusDropdownItem {
  final Object value;
  final Widget item;

  CusDropdownItem({required this.value, required this.item});
}

class CusDropdown extends StatefulWidget {
  final GlobalKey parentKey;
  final List<CusDropdownItem> cusDropdownItem;
  const CusDropdown({
    super.key,
    required this.parentKey,
    required this.cusDropdownItem,
  });

  @override
  State<CusDropdown> createState() => _CusDropdownState();
}

class _CusDropdownState extends State<CusDropdown> {
  @override
  void initState() {
    super.initState();
  }

  Offset? _getParentOffset() {
    final RenderBox? renderBox =
        widget.parentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return null;
    return renderBox.globalToLocal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

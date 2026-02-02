import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_switch.dart';
import 'package:crm_woorkroom/presentation/widgets/vacation_request_dialog.dart';
import 'package:flutter/material.dart';

class VacationsHeader extends StatelessWidget {
  final Map<String, Widget> views;
  final String activeType;
  final ValueChanged<String> onChanged;
  const VacationsHeader({
    super.key,
    required this.views,
    required this.activeType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Vacations", style: TextTheme.of(context).displayMedium),
            CusAnimatedSwitch(
              width: width * 0.32,
              items: views.keys.toList(),
              active: activeType,
              onChanged: onChanged,
            ),
            VacationRequestButton(),
          ],
        );
      },
    );
  }
}

import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_checkbox.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class StepTwoForm extends StatefulWidget {
  const StepTwoForm({super.key});

  @override
  State<StepTwoForm> createState() => _StepTwoFormState();
}

class _StepTwoFormState extends State<StepTwoForm> {
  final bool _isYes = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CusLabelTextfile(
          label: "Why will you use the service?",
          hintText: "Work",
        ),
        AppLayout.paddingLarge.heightBox,
        CusLabelTextfile(
          label: "What describes you best?",
          hintText: "Business Owner",
        ),
        AppLayout.paddingLarge.heightBox,
        Row(
          children: [
            Expanded(
              child: Text(
                "What describes you best?",
                style: TextTheme.of(context).labelMedium,
              ),
            ),
            CusCheckbox(
              value: _isYes,
              onChanged: (value) {},
              borderRadius: 100,
              showIcon: false,
            ),
            AppLayout.paddingSmall.widthBox,
            Text("Yes", style: TextTheme.of(context).bodyMedium),
            AppLayout.paddingLarge.widthBox,
            CusCheckbox(
              value: !_isYes,
              onChanged: (value) {},
              borderRadius: 100,
              showIcon: false,
            ),
            AppLayout.paddingSmall.widthBox,
            Text("No", style: TextTheme.of(context).bodyMedium),
          ],
        ),
      ],
    );
  }
}

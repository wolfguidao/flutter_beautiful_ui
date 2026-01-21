import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class StepFourForm extends StatefulWidget {
  const StepFourForm({super.key});

  @override
  State<StepFourForm> createState() => _StepFourFormState();
}

class _StepFourFormState extends State<StepFourForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CusLabelTextfile(
          label: "Member's Email",
          hintText: "memberemail@gmail.com",
        ),
        AppLayout.paddingSmall.heightBox,
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColor.primaryColor,
          ),
          child: Row(
            children: [
              Icon(Icons.add, size: 15),
              AppLayout.paddingMedium.widthBox,
              Text(
                "Add another Member",
                style: TextStyle(
                  fontSize: TextTheme.of(context).labelMedium?.fontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

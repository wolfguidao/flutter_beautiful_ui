import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class StepOneForm extends StatefulWidget {
  const StepOneForm({super.key});

  @override
  State<StepOneForm> createState() => _StepOneFormState();
}

class _StepOneFormState extends State<StepOneForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mobile Number", style: TextTheme.of(context).labelMedium),
        (AppLayout.paddingSmall * 0.5).heightBox,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                style: TextTheme.of(context).bodyMedium,
                decoration: InputDecoration(hintText: "+86"),
              ),
            ),
            AppLayout.paddingMedium.widthBox,
            Expanded(
              flex: 5,
              child: TextField(
                style: TextTheme.of(context).bodyMedium,
                decoration: InputDecoration(hintText: "342 567-23-56"),
              ),
            ),
          ],
        ),
        AppLayout.paddingLarge.heightBox,
        Text("Code from SMS", style: TextTheme.of(context).labelMedium),
        (AppLayout.paddingSmall * 0.5).heightBox,
        Row(
          children: [
            SizedBox(
              width: 35,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextTheme.of(context).bodyMedium,
                decoration: InputDecoration(hintText: "1"),
              ),
            ),
            AppLayout.paddingSmall.widthBox,
            SizedBox(
              width: 35,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextTheme.of(context).bodyMedium,
                decoration: InputDecoration(hintText: "2"),
              ),
            ),
            AppLayout.paddingSmall.widthBox,
            SizedBox(
              width: 35,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextTheme.of(context).bodyMedium,
                decoration: InputDecoration(hintText: "3"),
              ),
            ),
            AppLayout.paddingSmall.widthBox,
            SizedBox(
              width: 35,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextTheme.of(context).bodyMedium,
                decoration: InputDecoration(hintText: "4"),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: AppLayout.paddingLarge),
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.paddingMedium,
            vertical: AppLayout.paddingLarge,
          ),
          decoration: BoxDecoration(
            color: Color(0xffF4F9FD),
            borderRadius: BorderRadius.circular(AppLayout.borderRadius),
          ),
          child: Row(
            children: [
              Icon(Icons.info_rounded, color: AppColor.primaryColor),
              AppLayout.paddingSmall.widthBox,
              Expanded(
                child: Text(
                  "SMS was sent to your number +1 345 673-56-67 \n It will be valid for 01:25",
                  style: TextStyle(
                    fontSize: TextTheme.of(context).labelMedium?.fontSize,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        CusLabelTextfile(
          label: "Email Address",
          hintText: "yourmail@gmail.com",
        ),
        AppLayout.paddingLarge.heightBox,
        CusLabelTextfile(
          label: "Create Password",
          hintText: "Enter your password",
        ),
      ],
    );
  }
}

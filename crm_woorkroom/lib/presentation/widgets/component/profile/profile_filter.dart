import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:flutter/material.dart';

class ProfileFilter extends StatefulWidget {
  const ProfileFilter({super.key});

  @override
  State<ProfileFilter> createState() => _ProfileFilterState();
}

class _ProfileFilterState extends State<ProfileFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_list_outlined, size: 20),
        ),
        AppLayout.paddingSmall.widthBox,
        Container(
          padding: (AppLayout.paddingSmall * 0.6).allPadding,
          decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(AppLayout.borderRadius / 2),
          ),
          child: Row(
            children: [
              Text("Current Projects"),
              Icon(Icons.keyboard_arrow_down, size: 15),
            ],
          ),
        ),
      ],
    );
  }
}

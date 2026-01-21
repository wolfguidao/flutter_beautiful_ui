import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignSuccess extends StatelessWidget {
  const SignSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.backgroundColor,
      child: Container(
        margin: (AppLayout.paddingLarge * 1.2).allPadding,
        padding: AppLayout.paddingLarge.allPadding,
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        ),
        child: Column(
          children: [
            SvgPicture.asset(Assets.images.authIllus),
            Padding(
              padding: AppLayout.paddingLarge.allPadding,
              child: Text(
                "You are successfully registered!",
                style: TextTheme.of(context).displaySmall,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(maximumSize: Size(120, 200)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Let's Start",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).bodyMedium?.fontSize,
                    ),
                  ),
                  Icon(Icons.arrow_forward_outlined, size: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

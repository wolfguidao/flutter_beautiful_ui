import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SupportDialog();
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.messenger,
            colorFilter: ColorFilter.mode(
              AppColor.secondColor,
              BlendMode.srcIn,
            ),
            width: 15,
          ),
          AppLayout.paddingSmall.widthBox,
          Text(
            "Support",
            style: TextStyle(
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class SupportDialog extends StatelessWidget {
  const SupportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Dialog(
      backgroundColor: AppColor.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadius),
      ),
      child: Container(
        width: width * 0.4,
        height: height * 0.65,
        padding: AppLayout.paddingLarge.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Need some Help?",
                  style: TextTheme.of(context).displayMedium,
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, size: 20),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: height * 0.15,
              margin: AppLayout.paddingMedium.verticalPadding,
              child: Stack(
                alignment: AlignmentGeometry.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffECF3FF),
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SvgPicture.asset(
                      Assets.images.navIllus,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                      height: height * 0.1,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Describe your question and our specialists will answer you within 24 hours.",
              style: TextTheme.of(context).labelMedium,
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelTextfile(
              label: "Request Subject",
              hintText: "Technical difficulites",
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelTextfile(
              label: "Description",
              hintText: "Add some description of the request",
              minLines: 5,
            ),
            Spacer(),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save Task",
                  style: TextStyle(
                    fontSize: TextTheme.of(context).labelMedium?.fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

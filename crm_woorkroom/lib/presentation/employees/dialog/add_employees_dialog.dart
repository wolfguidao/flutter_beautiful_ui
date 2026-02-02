import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddEmployeesButton extends StatelessWidget {
  const AddEmployeesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AddEmployeesDialog();
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.add, size: 15),
          Text(
            "Add Employee",
            style: TextStyle(
              fontSize: TextTheme.of(context).labelMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class AddEmployeesDialog extends StatefulWidget {
  const AddEmployeesDialog({super.key});

  @override
  State<AddEmployeesDialog> createState() => _AddEmployeesDialogState();
}

class _AddEmployeesDialogState extends State<AddEmployeesDialog> {
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
        height: height * 0.5,
        padding: AppLayout.paddingLarge.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Emoloyee",
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
            SizedBox(
              width: double.infinity,
              height: height * 0.15,
              child: Stack(
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  Container(
                    padding: AppLayout.paddingMedium.allPadding,
                    margin: AppLayout.paddingLarge.horizontalPadding,
                    height: height * 0.125,
                    decoration: BoxDecoration(
                      color: Color(0xffECF3FF),
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.images.addEmployeeIllus,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            AppLayout.paddingMedium.heightBox,
            CusLabelTextfile(
              label: "Member's Email",
              hintText: "memberemail@gmail.com",
            ),
            AppLayout.paddingMedium.heightBox,
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.add, size: 15, color: AppColor.primaryColor),
                  Text(
                    "Add Another Member",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).labelMedium?.fontSize,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Approve",
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

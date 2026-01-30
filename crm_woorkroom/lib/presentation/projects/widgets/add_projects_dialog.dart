import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddProjectsDialog extends StatefulWidget {
  const AddProjectsDialog({super.key});

  @override
  State<AddProjectsDialog> createState() => _AddProjectsDialogState();
}

class _AddProjectsDialogState extends State<AddProjectsDialog> {
  final List<String> _projectImage = [
    Assets.images.projectImage01,
    Assets.images.projectImage02,
    Assets.images.projectImage03,
    Assets.images.projectImage04,
    Assets.images.projectImage05,
    Assets.images.projectImage06,
    Assets.images.projectImage07,
    Assets.images.uploadImage,
  ];

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
        width: width * 0.7,
        height: height * 0.75,
        padding: EdgeInsets.symmetric(
          vertical: AppLayout.paddingLarge*2,
          horizontal: AppLayout.paddingLarge * 4,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Project", style: TextTheme.of(context).displayLarge),
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
            AppLayout.paddingLarge.heightBox,
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        CusLabelTextfile(
                          label: "Project Name",
                          hintText: "Project Name",
                        ),
                        AppLayout.paddingMedium.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: CusLabelTextfile(
                                label: "Start",
                                hintText: "Select Date",
                              ),
                            ),
                            AppLayout.paddingMedium.widthBox,
                            Expanded(
                              child: CusLabelTextfile(
                                label: "Dead Line",
                                hintText: "Select Date",
                              ),
                            ),
                          ],
                        ),
                        AppLayout.paddingMedium.heightBox,
                        CusLabelTextfile(label: "Priority", hintText: "Medium"),
                        AppLayout.paddingMedium.heightBox,
                        CusLabelTextfile(
                          label: "Description",
                          hintText: "Add some description of the project",
                          minLines: 5,
                        ),
                      ],
                    ),
                  ),
                  (AppLayout.paddingLarge * 2).widthBox,
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: AppLayout.paddingMedium.allPadding,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.borderColor),
                            borderRadius: BorderRadius.circular(
                              AppLayout.borderRadius,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Image",
                                style: TextTheme.of(context).displaySmall,
                              ),
                              AppLayout.paddingMedium.heightBox,
                              Text(
                                "Select or upload an avatar for the project (available formats: jpg, png)",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              AppLayout.paddingMedium.heightBox,
                              Wrap(
                                alignment: WrapAlignment.start,
                                children: _projectImage.map((value) {
                                  return Padding(
                                    padding: EdgeInsetsGeometry.only(
                                      right: AppLayout.paddingSmall*0.9,
                                      bottom: AppLayout.paddingLarge,
                                    ),
                                    child: SvgPicture.asset(value, width: 40),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        AppLayout.paddingSmall.heightBox,
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffF1EFFB),
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius,
                                ),
                              ),
                              child: Icon(
                                Icons.link_rounded,
                                color: Color(0xff6D5DD3),
                              ),
                            ),
                            AppLayout.paddingSmall.widthBox,
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffE8F9FC),
                                borderRadius: BorderRadius.circular(
                                  AppLayout.borderRadius,
                                ),
                              ),
                              child: Icon(
                                Icons.all_inclusive,
                                color: Color(0xff15C0E6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save Project",
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

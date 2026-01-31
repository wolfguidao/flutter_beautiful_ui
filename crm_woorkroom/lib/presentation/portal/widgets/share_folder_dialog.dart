import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_label_textfile.dart';
import 'package:flutter/material.dart';

class ShareFolderDialog extends StatefulWidget {
  const ShareFolderDialog({super.key});

  @override
  State<ShareFolderDialog> createState() => _ShareFolderDialogState();
}

class _ShareFolderDialogState extends State<ShareFolderDialog> {
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
        width: width * 0.35,
        height: height * 0.3,
        padding: AppLayout.paddingSmall.allPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Share the Folder",
                  style: TextTheme.of(context).displayLarge,
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
            AppLayout.paddingLarge.heightBox,
            CusLabelTextfile(
              label: "Select Member",
              hintText: "memberemail@gmail.com",
            ),
            AppLayout.paddingLarge.heightBox,
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.secondColor,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 20, color: AppColor.primaryColor),
                    AppLayout.paddingSmall.widthBox,
                    Text(
                      "Add another Member",
                      style: TextStyle(
                        fontSize: TextTheme.of(context).bodySmall?.fontSize,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Share",
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

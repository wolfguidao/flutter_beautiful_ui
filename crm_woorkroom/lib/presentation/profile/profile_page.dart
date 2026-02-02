import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/profile/sections/profile_setting.dart';
import 'package:crm_woorkroom/presentation/widgets/profile/profile_detail.dart';
import 'package:crm_woorkroom/presentation/widgets/profile/profile_detail_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showSetting = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          children: [
            Row(
              children: [
                Text("My Profile", style: TextTheme.of(context).displayMedium),
                Spacer(),
                IconButton(
                  style: IconButton.styleFrom(
                    minimumSize: Size(35, 35),
                    maximumSize: Size(35, 35),
                    backgroundColor: AppColor.secondColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppLayout.borderRadius,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _showSetting = true;
                    });
                  },
                  icon: Icon(Icons.settings_outlined, size: 18),
                ),
              ],
            ),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: Row(
                children: [
                  ProfileDetailBar(width: width, employee: AppMock.user),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(
                    child: _showSetting
                        ? ProfileSetting(
                            onBack: () {
                              setState(() {
                                _showSetting = false;
                              });
                            },
                          )
                        : ProfileDetail(employee: AppMock.user),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

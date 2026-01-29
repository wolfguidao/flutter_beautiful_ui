import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_add_request.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_filter.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_projects.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_team.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_vacations.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_animated_switch.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  final Employee employee;
  const ProfileDetail({super.key, required this.employee});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final List<String> _detailType = ["Projects", "Team", "My Vacations"];
  String _activeType = "Projects";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CusAnimatedSwitch(
                  width: width * 0.4,
                  items: _detailType,
                  active: _activeType,
                  onChanged: (value) {
                    setState(() {
                      _activeType = value;
                    });
                  },
                ),
                Spacer(),
                switch (_activeType) {
                  "Projects" => ProfileFilter(),
                  "My Vacations" => ProfileAddRequest(),
                  _ => SizedBox.shrink(),
                },
              ],
            ),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: switch (_activeType) {
                "Projects" => ProfileProjects(employee: widget.employee),
                "Team" => ProfileTeam(employee: widget.employee),
                "My Vacations" => ProfileVacations(employee: widget.employee),
                _ => SizedBox.shrink(),
              },
            ),
          ],
        );
      },
    );
  }
}

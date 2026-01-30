import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/component/vacation_request_dialog.dart';
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

class _ProfileDetailState extends State<ProfileDetail>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  final List<String> _detailType = ["Projects", "Team", "My Vacations"];
  String _activeType = "Projects";

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(20.0 * (1 - _animation.value), 0),
              child: Opacity(opacity: _animation.value, child: child),
            );
          },
          child: Column(
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
                    "My Vacations" => VacationRequestDialog(),
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
          ),
        );
      },
    );
  }
}

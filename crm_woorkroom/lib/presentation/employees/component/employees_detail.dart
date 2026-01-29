import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/employee.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_detail.dart';
import 'package:crm_woorkroom/presentation/widgets/component/profile/profile_detail_bar.dart';
import 'package:flutter/material.dart';

class EmployeesDetail extends StatefulWidget {
  final Employee employee;
  final VoidCallback onBack;
  const EmployeesDetail({
    super.key,
    required this.employee,
    required this.onBack,
  });

  @override
  State<EmployeesDetail> createState() => _EmployeesDetailState();
}

class _EmployeesDetailState extends State<EmployeesDetail>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

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
        return Column(
          children: [
            // Header
            Row(
              children: [
                Text(
                  "Employee's Profile",
                  style: TextTheme.of(context).displayMedium,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => widget.onBack(),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.primaryColor,
                        size: 15,
                      ),
                      AppLayout.paddingSmall.widthBox,
                      Text(
                        "Back to Employees",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).labelMedium?.fontSize,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppLayout.paddingSmall.heightBox,
            Expanded(
              child: Row(
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(-20.0 * (1 - _animation.value), 0),
                        child: Opacity(opacity: _animation.value, child: child),
                      );
                    },
                    child: ProfileDetailBar(
                      width: width,
                      employee: widget.employee,
                    ),
                  ),
                  AppLayout.paddingSmall.widthBox,
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(20.0 * (1 - _animation.value), 0),
                          child: Opacity(
                            opacity: _animation.value,
                            child: child,
                          ),
                        );
                      },
                      child: ProfileDetail(employee: widget.employee),
                    ),
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

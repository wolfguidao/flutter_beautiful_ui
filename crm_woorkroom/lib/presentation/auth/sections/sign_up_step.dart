import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/auth/sections/sign_success.dart';
import 'package:crm_woorkroom/presentation/auth/widgets/step_four_form.dart';
import 'package:crm_woorkroom/presentation/auth/widgets/step_one_form.dart';
import 'package:crm_woorkroom/presentation/auth/widgets/step_three_form.dart';
import 'package:crm_woorkroom/presentation/auth/widgets/step_two_form.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_step_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpStep extends StatefulWidget {
  const SignUpStep({super.key});

  @override
  State<SignUpStep> createState() => _SignUpStepState();
}

class _SignUpStepState extends State<SignUpStep>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late int _activeIndex;
  late List<CusStepItem> _stepList;
  late List<Widget> _stepWidget;

  @override
  void initState() {
    _stepList = [
      CusStepItem(
        text: "Valid your phone",
        isActive: true,
        hasNext: true,
        hasDone: false,
      ),
      CusStepItem(
        text: "Tell about yourself",
        isActive: false,
        hasNext: true,
        hasDone: false,
      ),
      CusStepItem(
        text: "Tell about yout company",
        isActive: false,
        hasNext: true,
        hasDone: false,
      ),
      CusStepItem(
        text: "Invite Team Members",
        isActive: false,
        hasNext: false,
        hasDone: false,
      ),
    ];
    _stepWidget = [
      StepOneForm(),
      StepTwoForm(),
      StepThreeForm(),
      StepFourForm(),
    ];
    _activeIndex = 0;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
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
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: (AppLayout.paddingLarge * 1.2).allPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Step Line
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-20.0 * (1 - _animation.value), 0),
                child: Opacity(opacity: _animation.value, child: child),
              );
            },
            child: Container(
              width: width * 0.225,
              padding: AppLayout.paddingLarge.allPadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                color: AppColor.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets.images.logo, width: 35),
                  Padding(
                    padding: AppLayout.paddingLarge.verticalPadding,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: TextTheme.of(context).displayMedium?.fontSize,
                        color: AppColor.secondColor,
                      ),
                    ),
                  ),
                  CusStepLine(stepList: _stepList),
                ],
              ),
            ),
          ),
          // Step Form
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(20.0 * (1 - _animation.value), 0),
                child: Opacity(opacity: _animation.value, child: child),
              );
            },
            child: Container(
              width: width * 0.72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                color: AppColor.secondColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppLayout.paddingLarge,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "STEP ${_activeIndex + 1}/${_stepList.length}",
                            style: TextStyle(color: AppColor.primaryColor),
                          ),
                          Text(
                            _stepList[_activeIndex].text,
                            style: TextTheme.of(context).displaySmall,
                          ),
                          AppLayout.paddingLarge.heightBox,
                          Expanded(
                            child: SizedBox(
                              width: width * 0.3,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: Tween<double>(
                                      begin: 0,
                                      end: 1,
                                    ).animate(animation),
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(-0.3, 0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                                child: _stepWidget[_activeIndex],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Color(0xffE4E6E8), height: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.paddingLarge,
                      vertical: AppLayout.paddingMedium,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _activeIndex == 0
                            ? SizedBox.shrink()
                            : TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: AppColor.primaryColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _stepList[_activeIndex].hasDone = false;
                                    _stepList[_activeIndex].isActive = false;
                                    _activeIndex -= 1;
                                    _stepList[_activeIndex].hasDone = false;
                                    _stepList[_activeIndex].isActive = true;
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.arrow_back_rounded, size: 13),
                                    AppLayout.paddingSmall.widthBox,
                                    Text(
                                      "Previous",
                                      style: TextStyle(
                                        fontSize: TextTheme.of(
                                          context,
                                        ).labelMedium?.fontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _stepList[_activeIndex].hasDone = true;
                              if (_activeIndex < _stepList.length - 1) {
                                _activeIndex += 1;
                                _stepList[_activeIndex].isActive = true;
                                _stepList[_activeIndex].hasDone = false;
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignSuccess(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next Step",
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).labelMedium?.fontSize,
                                ),
                              ),
                              AppLayout.paddingSmall.widthBox,
                              Icon(Icons.arrow_forward_rounded, size: 13),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

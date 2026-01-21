import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/gen/assets.gen.dart';
import 'package:crm_woorkroom/presentation/auth/components/sign_success.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_checkbox.dart';
import 'package:crm_woorkroom/presentation/widgets/cus_label_textfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatefulWidget {
  final VoidCallback toSignUp;
  const SignIn({super.key, required this.toSignUp});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
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
    final double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: (AppLayout.paddingLarge * 1.2).allPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppLayout.borderRadius),
          bottomRight: Radius.circular(AppLayout.borderRadius),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.45,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppLayout.borderRadius),
                bottomLeft: Radius.circular(AppLayout.borderRadius),
              ),
            ),
            padding: (AppLayout.paddingLarge * 2).allPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.images.logo, width: 40),
                    AppLayout.paddingMedium.widthBox,
                    Text(
                      "Woorkroom",
                      style: TextStyle(
                        fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                AppLayout.paddingLarge.heightBox,
                Text(
                  "Your place to work \n Plan. Create. Control.",
                  style: TextStyle(
                    fontSize:
                        TextTheme.of(context).displayLarge!.fontSize! * 1.5,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: SvgPicture.asset(Assets.images.authIllus)),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 20.0 * (1 - _animation.value)),
                  child: Opacity(opacity: _animation.value, child: child),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1,
                  vertical: height * 0.15,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In to Woorkroom",
                        style: TextTheme.of(context).displayMedium,
                      ),
                      (height * 0.05).heightBox,
                      CusLabelTextfile(
                        label: "Email Address",
                        hintText: "yourmail@gmail.com",
                      ),
                      (height * 0.025).heightBox,
                      CusLabelTextfile(
                        label: "Password",
                        hintText: "Enter your password",
                      ),
                      (height * 0.05).heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CusCheckbox(value: true, onChanged: (value) {}),
                              AppLayout.paddingSmall.widthBox,
                              Text(
                                "Remeber me",
                                style: TextTheme.of(context).labelMedium,
                              ),
                            ],
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextTheme.of(context).labelMedium,
                          ),
                        ],
                      ),
                      (height * 0.08).heightBox,
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignSuccess(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          maximumSize: Size(width * 0.115, height),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign In", style: TextStyle(fontSize: 12)),
                            AppLayout.paddingSmall.widthBox,
                            Icon(Icons.arrow_forward_rounded, size: 15),
                          ],
                        ),
                      ),
                      (height * 0.025).heightBox,
                      TextButton(
                        onPressed: () => widget.toSignUp(),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).labelMedium?.fontSize,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

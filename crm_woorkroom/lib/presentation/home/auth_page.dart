import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/home/components/sign_in.dart';
import 'package:crm_woorkroom/presentation/home/components/sign_up_step.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.backgroundColor,
      child: _isSignIn
          ? SignIn(
              toSignUp: () {
                setState(() {
                  _isSignIn = false;
                });
              },
            )
          : SignUpStep(),
    );
  }
}

import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/presentation/home/components/sign_in.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.backgroundColor,
      child: SignIn(),
    );
  }
}

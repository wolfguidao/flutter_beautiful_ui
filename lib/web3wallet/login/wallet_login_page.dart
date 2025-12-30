import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/login/widget/login_background.dart';
import 'package:flutter_beautiful_ui/web3wallet/login/widget/login_form.dart';

class WalletLoginPage extends StatefulWidget {
  const WalletLoginPage({super.key});

  @override
  State<WalletLoginPage> createState() => _WalletLoginPageState();
}

class _WalletLoginPageState extends State<WalletLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f5f6),
      body: SafeArea(
        bottom: false,
        child: LoginBackground(child: LoginForm()),
      ),
    );
  }
}

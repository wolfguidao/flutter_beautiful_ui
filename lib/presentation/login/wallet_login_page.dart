import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/presentation/login/widget/wallet_login_background.dart';
import 'package:flutter_beautiful_ui/presentation/login/widget/wallet_login_form.dart';

class WalletLoginPage extends StatelessWidget {
  const WalletLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f5f6),
      body: SafeArea(
        bottom: false,
        child: WalletLoginBackground(child: WalletLoginForm()),
      ),
    );
  }
}

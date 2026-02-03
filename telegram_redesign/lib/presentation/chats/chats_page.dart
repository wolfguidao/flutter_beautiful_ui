import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.secondColor, title: Column()),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.borderColor),
            bottom: BorderSide(color: AppColors.borderColor),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text(index.toString());
          },
        ),
      ),
    );
  }
}

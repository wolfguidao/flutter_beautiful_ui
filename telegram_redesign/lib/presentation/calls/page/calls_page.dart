import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/mock/mock_data.dart';
import 'package:telegram_redesign/presentation/calls/widgets/call_item.dart';
import 'package:telegram_redesign/widgets/cus_animation_delay_item.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(decoration: InputDecoration(hintText: "Search")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.phone),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.borderColor),
            bottom: BorderSide(color: AppColors.borderColor),
          ),
        ),
        child: ListView.builder(
          itemCount: MockData.calls.length,
          itemBuilder: (context, index) {
            return CusAnimationDelayItem(
              index: index,
              child: CallItem(call: MockData.calls[index]),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:telegram_redesign/presentation/calls/calls_page.dart';
import 'package:telegram_redesign/presentation/chats/chats_page.dart';
import 'package:telegram_redesign/presentation/contacts/contacts_page.dart';
import 'package:telegram_redesign/presentation/home/sections/home_navigation.dart';
import 'package:telegram_redesign/presentation/setting/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 2;

  final List<Widget> _pageList = [
    CallsPage(),
    ContactsPage(),
    ChatsPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_activeIndex],
      bottomNavigationBar: HomeNavigation(
        activeIndex: _activeIndex,
        onChanged: (value) {
          setState(() {
            _activeIndex = value;
          });
        },
      ),
    );
  }
}

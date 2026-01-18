import 'package:awesome_interaction/ThemeChange/component/dark_moon.dart';
import 'package:awesome_interaction/ThemeChange/component/light_sun.dart';
import 'package:awesome_interaction/ThemeChange/theme_color.dart';
import 'package:flutter/material.dart';

class ThemeChange extends StatefulWidget {
  const ThemeChange({super.key});

  @override
  State<ThemeChange> createState() => _ThemeChangeState();
}

class _ThemeChangeState extends State<ThemeChange>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _moonAnimation;
  late final Animation<double> _sunAnimation;
  bool _isDark = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _moonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );
    _sunAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      decoration: BoxDecoration(color: _isDark ? Colors.black : Colors.white),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isDark = !_isDark;
            });

            if (_isDark) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 240,
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: _isDark
                  ? ThemeColor.darkBackground
                  : ThemeColor.lightBackground,
              boxShadow: _isDark
                  ? ThemeColor.darkButtonShadow
                  : ThemeColor.lightButtonShadow,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Stack(
              children: [
                DarkMoon(animation: _moonAnimation),
                LightSun(animation: _sunAnimation),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

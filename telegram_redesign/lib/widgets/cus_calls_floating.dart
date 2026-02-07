import 'package:flutter/material.dart';
import 'package:telegram_redesign/constant/app_colors.dart';
import 'package:telegram_redesign/constant/app_extension.dart';
import 'package:telegram_redesign/constant/app_globals.dart';
import 'package:telegram_redesign/constant/app_layout.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/widgets/cus_avatar_group.dart';
import 'package:telegram_redesign/widgets/cus_ripple_wrapper.dart';

class CallsTools {
  static OverlayEntry? _overlayEntry;

  static void show(Session session) {
    final overlay = AppGlobals.navigatorKey.currentState?.overlay;
    if (overlay == null) return;
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(
      builder: (context) => CusCallsFloating(session: session),
    );
    overlay.insert(_overlayEntry!);
  }

  static void close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class CusCallsFloating extends StatefulWidget {
  final Session session;
  const CusCallsFloating({super.key, required this.session});

  @override
  State<CusCallsFloating> createState() => _CusCallsFloatingState();
}

class _CusCallsFloatingState extends State<CusCallsFloating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _dragOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    )..addListener(() => _animationListener());
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animationListener() {
    setState(() {});
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.primaryDelta ?? 0;
      if (_dragOffset < -100) _dragOffset = -100;
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_dragOffset < -40 || (details.primaryVelocity ?? 0) < -500) {
      _controller.reverse().then((_) => CallsTools.close());
    } else {
      setState(() {
        _dragOffset = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double entryOffset =
        (1 - _controller.value) * -MediaQuery.of(context).padding.top;
    double totalOffset = entryOffset + _dragOffset;
    return Positioned(
      left: AppLayout.paddingSmall,
      right: AppLayout.paddingSmall,
      top: MediaQuery.of(context).padding.top,
      child: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: _controller.value,
          child: Transform.translate(
            offset: Offset(0, totalOffset),
            child: Container(
              height: context.screenHeight * 0.1,
              padding: AppLayout.paddingSmall.horizontalPadding,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(AppLayout.borderRadius),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CusAvatarGroup(
                          avatarList: widget.session.avatarList
                              .take(3)
                              .toList(),
                          width: context.screenWidth * 0.2,
                          size: 30,
                        ),
                        AppLayout.paddingSmall.widthBox,
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.session.name),
                              Text(
                                "Telegram voice call",
                                style: context.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xffEB4E3D),
                          ),
                          onPressed: () async {
                            await _controller.reverse();
                            CallsTools.close();
                          },
                          icon: Icon(
                            Icons.phone_disabled,
                            color: Colors.white,
                            size: context.iconSize,
                          ),
                        ),
                        CusRippleWrapper(
                          color: Color(0xff66CC53),
                          size: context.screenWidth * 0.125,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xff66CC53),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: context.iconSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onVerticalDragUpdate: (details) =>
                        _onVerticalDragUpdate(details),
                    onVerticalDragEnd: (details) => _onVerticalDragEnd(details),
                    child: Container(
                      width: context.screenWidth * 0.1,
                      padding: (AppLayout.paddingSmall * 0.2).allPadding,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppLayout.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

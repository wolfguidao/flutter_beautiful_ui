import 'package:crm_woorkroom/constant/app_extension.dart';
import 'package:crm_woorkroom/constant/app_mock.dart';
import 'package:crm_woorkroom/constant/app_style.dart';
import 'package:crm_woorkroom/entity/sys_notification.dart';
import 'package:crm_woorkroom/presentation/widgets/common/cus_circle_avatar.dart';
import 'package:flutter/material.dart';

class NotificationBar extends StatefulWidget {
  const NotificationBar({super.key});

  @override
  State<NotificationBar> createState() => _NotificationBarState();
}

class _NotificationBarState extends State<NotificationBar> {
  OverlayEntry? _overlayEntry;

  void _openFilters() {
    _removeOverlay();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return NotificationOverlay(removeOverlay: _removeOverlay);
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry == null) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        minimumSize: Size(35, 35),
        maximumSize: Size(35, 35),
        backgroundColor: AppColor.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadius),
        ),
      ),
      onPressed: () {
        _openFilters();
      },
      icon: Icon(Icons.notifications_on_outlined, size: 18),
    );
  }
}

class NotificationOverlay extends StatefulWidget {
  final VoidCallback removeOverlay;
  const NotificationOverlay({super.key, required this.removeOverlay});

  @override
  State<NotificationOverlay> createState() => _NotificationOverlayState();
}

class _NotificationOverlayState extends State<NotificationOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
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

  Future<void> _handleRemove() async {
    await _controller.reverse();
    widget.removeOverlay();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () async => await _handleRemove(),
              child: ColoredBox(color: AppColor.barrierColor),
            ),
          ),
          Positioned(
            right: AppLayout.paddingLarge,
            top: AppLayout.paddingLarge,
            bottom: AppLayout.paddingLarge,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionalTranslation(
                  translation: Offset(1.0 - _animation.value, 0),
                  child: Opacity(opacity: _animation.value, child: child),
                );
              },
              child: Container(
                width: width * 0.225,
                decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(AppLayout.borderRadius),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: AppLayout.paddingSmall.allPadding,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColor.borderColor),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notification",
                            style: TextTheme.of(context).displaySmall,
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColor.backgroundColor,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close, size: 20),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(
                          context,
                        ).copyWith(scrollbars: false),
                        child: ListView.builder(
                          itemCount: AppMock.notificationList.length,
                          itemBuilder: (context, index) {
                            SysNotification sysNotification =
                                AppMock.notificationList[index];
                            return Container(
                              padding: AppLayout.paddingSmall.allPadding,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.borderColor,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CusCircleAvatar(
                                    avatar: sysNotification.employee.avatar,
                                    size: 30,
                                  ),
                                  AppLayout.paddingSmall.widthBox,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sysNotification.content,
                                          style: TextStyle(
                                            fontSize: TextTheme.of(
                                              context,
                                            ).labelMedium?.fontSize,
                                          ),
                                        ),
                                        (AppLayout.paddingSmall / 2).heightBox,
                                        Text(
                                          sysNotification.sendTime,
                                          style: TextTheme.of(
                                            context,
                                          ).labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

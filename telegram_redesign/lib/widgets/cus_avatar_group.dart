import 'package:flutter/material.dart';
import 'package:telegram_redesign/widgets/cus_circle_avatar.dart';

class CusAvatarGroup extends StatelessWidget {
  final double width;
  final double size;
  final List<String> avatarList;
  const CusAvatarGroup({
    super.key,
    required this.avatarList,
    required this.width,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: List.generate(avatarList.length, (index) {
          final String avatar = avatarList[index];
          return Positioned(
            bottom: 0,
            top: 0,
            right: index * size * 0.65,
            child: CusCircleAvatar(
              avatar: avatar,
              size: size,
              showStatus: false,
            ),
          );
        }),
      ),
    );
  }
}

import 'package:telegram_redesign/entity/user.dart';

enum CallStatus { answered, hungUp, missed, rejected }

enum CallType { voice, video }

class Call {
  final String id;
  final User user;
  final CallStatus status;
  final CallType type;
  final DateTime time;
  final bool isOutgoing;
  final Duration? duration;

  Call({
    required this.id,
    required this.user,
    required this.status,
    required this.type,
    required this.time,
    this.isOutgoing = false,
    this.duration,
  });

  Call copyWith({
    String? id,
    User? user,
    CallStatus? status,
    CallType? type,
    DateTime? time,
    bool? isOutgoing,
    Duration? duration,
  }) {
    return Call(
      id: id ?? this.id,
      user: user ?? this.user,
      status: status ?? this.status,
      type: type ?? this.type,
      time: time ?? this.time,
      isOutgoing: isOutgoing ?? this.isOutgoing,
      duration: duration ?? this.duration,
    );
  }
}

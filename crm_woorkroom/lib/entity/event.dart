import 'dart:ui';

class Event {
  final String title;
  final String time;
  final String timeConsume;
  final EventLever lever;

  Event({
    required this.title,
    required this.time,
    required this.timeConsume,
    required this.lever,
  });
}

enum EventLever {
  low(text: "Low", color: Color(0xff0AC947)),
  medium(text: "Medium", color: Color(0xffFFBD21)),
  high(text: "High", color: Color(0xffDE92EB));

  final String text;
  final Color color;

  const EventLever({required this.text, required this.color});
}

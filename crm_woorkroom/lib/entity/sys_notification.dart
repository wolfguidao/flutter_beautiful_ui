import 'package:crm_woorkroom/entity/employee.dart';

class SysNotification {
  final Employee employee;
  final String content;
  final String sendTime;

  SysNotification({
    required this.employee,
    required this.content,
    required this.sendTime,
  });
}

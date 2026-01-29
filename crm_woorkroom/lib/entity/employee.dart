import 'package:crm_woorkroom/constant/app_enum.dart';

class Employee {
  final String name;
  final String avatar;
  final String position;
  final String lever;
  final String email;
  final String gender;
  final DateTime bitrhday;
  final int age;
  final String mobile;
  final String skype;
  final String company;
  final String location;
  final List<VacationRequest> vacationsRequest;
  final List<UserVacation> userVacation;
  final List<Employee> teamMember;

  Employee({
    required this.name,
    required this.avatar,
    required this.position,
    required this.lever,
    required this.email,
    required this.gender,
    required this.bitrhday,
    required this.age,
    required this.mobile,
    required this.skype,
    required this.company,
    required this.location,
    required this.vacationsRequest,
    required this.userVacation,
    required this.teamMember,
  });
}

class UserVacation {
  final VacationType type;
  final int used;
  final int total;

  UserVacation({required this.type, required this.used, required this.total});
}

class VacationRequest {
  final VacationType type;
  final DateTime date;
  final DateTime startDay;
  final DateTime endDay;
  final bool isApproved;

  VacationRequest({
    required this.type,
    required this.date,
    required this.isApproved,
    required this.startDay,
    required this.endDay,
  });

  int get duration {
    return endDay.difference(startDay).inDays;
  }
}

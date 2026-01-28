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
  final List<UserVacation> vacations;

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
    required this.vacations,
  });
}

class UserVacation {
  final VacationType type;
  final DateTime date;
  final bool isApproved;

  UserVacation({
    required this.type,
    required this.date,
    required this.isApproved,
  });
}

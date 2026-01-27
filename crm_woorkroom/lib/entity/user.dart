import 'package:crm_woorkroom/constant/app_enum.dart';

class User {
  final String name;
  final String avatar;
  final String role;
  final String lever;
  final String email;
  final List<UserVacation> vacations;

  User(
    this.name,
    this.avatar,
    this.role,
    this.lever,
    this.email,
    this.vacations,
  );
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

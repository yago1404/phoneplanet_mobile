part of 'bloc.dart';

abstract class RegisterEvent {}

class SavePersonalData extends RegisterEvent {
  final String name;
  final String email;
  final String birthday;
  final String cpf;

  SavePersonalData({
    required this.name,
    required this.birthday,
    required this.email,
    required this.cpf,
  });
}

class SavePassword extends RegisterEvent {
  final String password;

  SavePassword({
    required this.password,
  });
}
part of 'bloc.dart';

abstract class RegisterEvent {}

class SavePersonalData extends RegisterEvent {
  final String name;
  final String email;
  final String birthday;
  final String cpf;
  final Function onSuccess;
  final Function({required String title, required String message}) onError;

  SavePersonalData({
    required this.name,
    required this.birthday,
    required this.email,
    required this.cpf,
    required this.onSuccess,
    required this.onError,
  });
}

class SavePassword extends RegisterEvent {
  final String password;
  final Function({required String message}) onError;
  final Function onSuccess;

  SavePassword({
    required this.password,
    required this.onError,
    required this.onSuccess,
  });
}
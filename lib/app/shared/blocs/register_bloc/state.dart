part of 'bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends RegisterState {}

class Loaded extends RegisterState {
  final String? name;
  final String? email;
  final String? birthday;
  final String? cpf;
  final String? password;

  Loaded({
    this.name,
    this.birthday,
    this.email,
    this.cpf,
    this.password,
  });

  @override
  List<Object> get props => [
        name ?? '',
        email ?? '',
        birthday ?? '',
      ];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});

  @override
  List<Object> get props => [message];
}

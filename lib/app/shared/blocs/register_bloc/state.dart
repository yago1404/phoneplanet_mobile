part of 'bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends RegisterState {}

class Loaded extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});

  @override
  List<Object> get props => [message];
}

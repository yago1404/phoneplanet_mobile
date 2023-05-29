import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/api/api.dart';

part 'state.dart';

part 'event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository repository;

  RegisterBloc({required this.repository}) : super(Loaded()) {
    on<SavePersonalData>(_savePersonalData);
    on<SavePassword>(_savePassword);
  }

  Future<void> _savePersonalData(
    SavePersonalData event,
    Emitter<RegisterState> emit,
  ) async {
    emit(Loading());
    try {
      await repository.checkAvailability(
        email: event.email,
        cpf: event.cpf,
      );
      emit(
        Loaded(
          name: event.name,
          email: event.email,
          birthday: event.birthday,
          cpf: event.cpf,
        ),
      );
      event.onSuccess();
    } on ApiException catch (e) {
      event.onError(title: 'Erro ao checar dados', message: e.message ?? 'Erro ao checar dados');
      return emit(RegisterError(message: e.message ?? 'Erro ao checar dados'));
    }
  }

  Future<void> _savePassword(
    SavePassword event,
    Emitter<RegisterState> emit,
  ) async {
    if (state is Loaded) {
      Loaded loadedState = state as Loaded;
      emit(
        Loaded(
          name: loadedState.name,
          email: loadedState.email,
          birthday: loadedState.birthday,
          cpf: loadedState.cpf,
          password: event.password,
        ),
      );
    }
  }
}

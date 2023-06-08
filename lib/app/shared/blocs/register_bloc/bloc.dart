import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/api/api.dart';
import 'package:phoneplanet/api/models/user_prospect.dart';

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
      repository.userProspect = UserProspect(
        name: event.name,
        birthday: event.birthday,
        cpf: event.cpf,
        email: event.email,
      );
      emit(Loaded());
      event.onSuccess();
    } on ApiException catch (e) {
      event.onError(
        title: 'Erro ao checar dados',
        message: e.message ?? 'Erro ao checar dados',
      );
      return emit(
        RegisterError(message: e.message ?? 'Erro ao checar dados'),
      );
    }
  }

  Future<void> _savePassword(
    SavePassword event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(Loading());
      String birthday = repository.userProspect!.birthday;
      List<String> birthdayList = birthday.split('/');
      birthday = '${birthdayList[2]}-${birthdayList[1]}-${birthdayList[0]}';
      Map<String, dynamic> response = await repository.createUser({
        'name': repository.userProspect!.name,
        'email': repository.userProspect!.email,
        'birthday': birthday,
        'cpf': repository.userProspect!.cpf,
        'password': event.password,
      });
      emit(Loaded());
      event.onSuccess();
    } on ApiException catch (e) {
      event.onError(message: e.message ?? 'Erro desconhecido');
      emit(RegisterError(message: e.message ?? 'Erro desconhecido'));
    }
  }
}

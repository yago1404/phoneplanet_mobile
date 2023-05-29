import 'package:phoneplanet/api/api.dart';

class UserRepository {
  final IService service;

  UserRepository({required this.service});

  Future<bool> checkAvailability({String? email, String? cpf}) async {
    Map<String, dynamic> response = await service.get('/users/check-availability?email=$email&cpf=$cpf');
    return response['statusCode'] == 200;
  }

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> user) async {
    return await service.post('/users/create', body: user);
  }
}
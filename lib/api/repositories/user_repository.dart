import 'package:phoneplanet/api/api.dart';
import 'package:phoneplanet/api/models/user.dart';
import 'package:phoneplanet/api/models/user_prospect.dart';

class UserRepository {
  UserProspect? userProspect;
  User? user;
  final IService service;

  UserRepository({required this.service});

  Future<bool> checkAvailability({String? email, String? cpf}) async {
    Map<String, dynamic> response = await service.get('/users/check-availability?email=$email&cpf=$cpf');
    return response['statusCode'] == 200;
  }

  Future<void> createUser(Map<String, dynamic> user) async {
    Map<String, dynamic> response = await service.post('/users/create', body: user);
    this.user = User.fromJson(response['result']['user']);
  }
}
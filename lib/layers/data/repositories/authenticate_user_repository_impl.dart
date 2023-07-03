import 'package:easyflow/layers/data/datasources/authenticate_user_datasource.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/repositories/authenticate_user_repository.dart';


class AuthenticateUserRepositoryImpl implements AuthenticateUserRepository {
  final AuthenticateUserDatasource _authenticateUserDatasource;

  AuthenticateUserRepositoryImpl(this._authenticateUserDatasource);
  @override
  Future<UserEntity> call(String login, String password) async {
    return _authenticateUserDatasource(login, password);
  }
}

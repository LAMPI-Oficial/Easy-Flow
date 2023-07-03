import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/repositories/authenticate_user_repository.dart';

abstract class AuthenticateUserUseCase {
  Future<UserEntity> call(String login, String password);
}

class AuthenticateUserUseCaseImpl implements AuthenticateUserUseCase {
  final AuthenticateUserRepository _authenticateUserRepository;

  AuthenticateUserUseCaseImpl(this._authenticateUserRepository);
  @override
  Future<UserEntity> call(String login, String password) async {
    return _authenticateUserRepository(login, password);
  }
}

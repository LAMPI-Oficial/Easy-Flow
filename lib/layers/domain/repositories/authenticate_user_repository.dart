import 'package:easyflow/layers/domain/entities/user_entity.dart';

abstract class AuthenticateUserRepository {
  Future<UserEntity> call(String login, String password);
}

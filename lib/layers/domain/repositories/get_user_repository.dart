import 'package:easyflow/layers/domain/entities/user_entity.dart';

abstract class GetUserRepository{
  Future<UserEntity> call();
}

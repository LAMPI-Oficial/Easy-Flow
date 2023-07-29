import 'package:easyflow/layers/domain/entities/user_entity.dart';

abstract class GetUserDataSource {
  Future<UserEntity> call();
}

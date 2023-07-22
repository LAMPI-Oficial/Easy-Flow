import 'package:easyflow/layers/data/dto/user_dto.dart';

abstract class PatchUserRepository {
  Future<UserDto> call(UserDto userDto);
}

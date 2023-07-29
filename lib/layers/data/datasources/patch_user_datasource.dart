import 'package:easyflow/layers/data/dto/user_dto.dart';

abstract class PatchUserDataSource {
  Future<UserDto> call(UserDto userDto);
}

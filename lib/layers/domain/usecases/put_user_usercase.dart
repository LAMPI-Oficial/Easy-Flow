import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:easyflow/layers/domain/repositories/patch_user_repository.dart';

abstract class PatchUserUserCase {
  Future<UserDto> call(UserDto userDto);
}

class PatchUserUserCaseImpl implements PatchUserUserCase {
  final PatchUserRepository patchUserRepository;
  PatchUserUserCaseImpl(this.patchUserRepository);

  @override
  Future<UserDto> call(UserDto userDto) async {
    return patchUserRepository(userDto);
  }
}

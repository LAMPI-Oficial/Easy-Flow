import 'package:easyflow/layers/data/datasources/patch_user_datasource.dart';
import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:easyflow/layers/domain/repositories/patch_user_repository.dart';

class PatchUserRepositoryImpl implements PatchUserRepository {
  final PatchUserDataSource patchUserDataSource;
  PatchUserRepositoryImpl(this.patchUserDataSource);
  @override
  Future<UserDto> call(UserDto userDto) async {
    return patchUserDataSource(userDto);
  }
}

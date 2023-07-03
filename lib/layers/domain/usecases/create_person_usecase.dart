import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/repositories/create_person_repository.dart';


abstract class CreatePersonUseCase {
  Future<UserEntity> call(
      CreatePersonEntity createPersonEntity);
}

class CreatePersonUseCaseImpl implements CreatePersonUseCase {
  final CreatePersonRepository _createPersonRepository;

  CreatePersonUseCaseImpl(this._createPersonRepository);
  @override
  Future<UserEntity> call(
      CreatePersonEntity createUserEntity) async {
    return _createPersonRepository(createUserEntity);
  }
}

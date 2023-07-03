import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/usecases/authenticate_user_usecase.dart';
import '../../domain/entities/create_person_entity.dart';
import '../../domain/usecases/create_person_usecase.dart';

class UserController {
  final AuthenticateUserUseCase _authenticateUserUseCase;
  final CreatePersonUseCase _createPersonUseCase;

  UserController(this._authenticateUserUseCase, this._createPersonUseCase);

  Future<UserEntity> login(
      String login, String password) async {
    return _authenticateUserUseCase(login, password);
  }

  Future<UserEntity> createPerson(
      CreatePersonEntity createUserEntity) async {
    return _createPersonUseCase(createUserEntity);
  }
}

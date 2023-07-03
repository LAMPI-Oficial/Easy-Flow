
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import '../entities/create_person_entity.dart';

abstract class CreatePersonRepository {
  Future<UserEntity> call(CreatePersonEntity createPersonEntity);
}

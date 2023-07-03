import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';



abstract class CreatePersonDatasource {
  Future<UserEntity> call(
      CreatePersonEntity createPersonEntity);
}

import 'package:easyflow/layers/domain/entities/user_entity.dart';
import '../../domain/entities/create_person_entity.dart';
import '../../domain/repositories/create_person_repository.dart';
import '../datasources/create_person_datasource.dart';

class CreatePersonRepositoryImpl implements CreatePersonRepository {
  final CreatePersonDatasource _createPersonDatasource;

  CreatePersonRepositoryImpl(this._createPersonDatasource);
  @override
  Future<UserEntity> call(CreatePersonEntity createPersonEntity) async {
    return _createPersonDatasource(createPersonEntity);
  }
}

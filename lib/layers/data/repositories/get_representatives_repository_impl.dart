import 'package:easyflow/layers/data/datasources/get_representatives_datasource.dart';
import 'package:easyflow/layers/domain/entities/representative_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_representative_repository.dart';

class GetRepresentativesRepositoryimpl implements GetRepresentativesRepository {
  final GetRepresentativesDataSource getRepresentativesDataSource;
  GetRepresentativesRepositoryimpl(this.getRepresentativesDataSource);
  @override
  Future<List<RepresentativeEntity>> call() async {
    return getRepresentativesDataSource();
  }
}

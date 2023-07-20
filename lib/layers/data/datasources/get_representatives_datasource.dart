import 'package:easyflow/layers/domain/entities/representative_entity.dart';

abstract class GetRepresentativesDataSource {
  Future<List<RepresentativeEntity>> call();
}

import 'package:easyflow/layers/domain/entities/representative_entity.dart';

abstract class GetRepresentativesRepository {
  Future<List<RepresentativeEntity>> call();
}

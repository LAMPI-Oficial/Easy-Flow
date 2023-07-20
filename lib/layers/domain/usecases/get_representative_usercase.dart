import 'package:easyflow/layers/domain/entities/representative_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_representative_repository.dart';

abstract class GetRepresentativesUserCase {
  Future<List<RepresentativeEntity>> call();
}

class GetRepresentativesUseCaseImpl implements GetRepresentativesUserCase {
  final GetRepresentativesRepository getAnnouncementRepository;

  GetRepresentativesUseCaseImpl(this.getAnnouncementRepository);
  @override
  Future<List<RepresentativeEntity>> call() async {
    return getAnnouncementRepository();
  }
}

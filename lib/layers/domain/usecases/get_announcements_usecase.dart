import 'package:easyflow/layers/domain/entities/announcements_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_announcements_repository.dart';

abstract class GetAnnouncementsUseCase {
  Future<List<AnnouncementsEntity>> call();
}

class GetAnnouncementsUseCaseImpl implements GetAnnouncementsUseCase {
  final GetAnnouncementsRepository getAnnouncementsRepository;
  GetAnnouncementsUseCaseImpl(this.getAnnouncementsRepository);

  @override
  Future<List<AnnouncementsEntity>> call() async {
    return getAnnouncementsRepository();
  }
}

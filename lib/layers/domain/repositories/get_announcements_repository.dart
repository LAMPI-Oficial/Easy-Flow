import 'package:easyflow/layers/domain/entities/announcements_entity.dart';

abstract class GetAnnouncementsRepository {
  Future<List<AnnouncementsEntity>> call();
}

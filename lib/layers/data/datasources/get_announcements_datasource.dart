import 'package:easyflow/layers/domain/entities/announcements_entity.dart';

abstract class GetAnnouncementsDataSource {
  Future<List<AnnouncementsEntity>> call();
}

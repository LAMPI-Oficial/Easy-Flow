import 'package:easyflow/layers/data/datasources/get_announcements_datasource.dart';
import 'package:easyflow/layers/domain/entities/announcements_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_announcements_repository.dart';

class GetAnnouncementRepositoryImpl implements GetAnnouncementsRepository {
  final GetAnnouncementsDataSource getAnnouncementsDataSource;

  GetAnnouncementRepositoryImpl(this.getAnnouncementsDataSource);
  @override
  Future<List<AnnouncementsEntity>> call() async {
    return getAnnouncementsDataSource();
  }
}

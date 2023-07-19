import 'package:easyflow/layers/domain/entities/announcements_entity.dart';
import 'package:easyflow/layers/domain/entities/representative_entity.dart';
import 'package:easyflow/layers/domain/usecases/get_announcements_usecase.dart';

class HomeController {
  final GetAnnouncementsUseCase getAnnouncementsUseCase;

  HomeController(this.getAnnouncementsUseCase);

  Future<List<AnnouncementsEntity>> getAnnouncements() async {
    return getAnnouncementsUseCase.call();
  }

  Future<List<RepresentativeEntity>> getRepresentatives() async {
    return <RepresentativeEntity>[
      RepresentativeEntity(
        name: 'Michael Alves Pereira',
        studyArea: 'Programação web',
        email: 'maicon159951@gmail.com',
        imageUrl: null,
        id: 1,
      ),
      RepresentativeEntity(
        name: 'Rubens Silva',
        studyArea: 'IA',
        email: 'rubens@gmail.com',
        imageUrl: null,
        id: 2,
      ),
    ];
  }
}

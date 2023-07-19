import 'package:easyflow/layers/domain/entities/announcements_entity.dart';
import 'package:easyflow/layers/domain/entities/representative_entity.dart';
import 'package:easyflow/layers/domain/usecases/get_announcements_usecase.dart';

class HomeController {
  final GetAnnouncementsUseCase getAnnouncementsUseCase;

  HomeController(this.getAnnouncementsUseCase);

  Future<List<AnnouncementsEntity>> getAnnouncements() async {
    return getAnnouncementsUseCase.call();
    // return <AnnouncementsEntity>[
    //   AnnouncementsEntity(
    //     id: "ddddddddddd",
    //     description: 'description',
    //     urlPhoto: 'https://dotsy.com.br/wp-content/uploads/2021/04/teste.png',
    //     representative: RepresentativeEntity(
    //         name: 'Michael Alves Pereira',
    //         studyArea: 'Programação web',
    //         email: 'maicon159951@gmail.com',
    //         imageUrl: null,
    //         id: 2),
    //   ),
    //   AnnouncementsEntity(
    //     id: "keffnejnfje",
    //     description: 'description',
    //     representative: RepresentativeEntity(
    //         name: 'Michael Alves Pereira',
    //         studyArea: 'Programação web',
    //         email: 'maicon159951@gmail.com',
    //         imageUrl: null,
    //         id: 1),
    //   ),
    // ];
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

import 'package:easyflow/layers/domain/entities/announcements_model.dart';
import 'package:easyflow/layers/domain/entities/representative_model.dart';

class HomeController {
  Future<List<AnnouncementsModel>> getAnnouncements() async {
    return <AnnouncementsModel>[
      AnnouncementsModel(
        description: 'description',
        urlPhoto: 'https://dotsy.com.br/wp-content/uploads/2021/04/teste.png',
        representative: RepresentativeModel(
            name: 'Michael Alves Pereira',
            area: 'Programação web',
            email: 'maicon159951@gmail.com',
            imageUrl: null,
            turn: '',
            id: 2),
      ),
      AnnouncementsModel(
        description: 'description',
        representative: RepresentativeModel(
            name: 'Michael Alves Pereira',
            area: 'Programação web',
            email: 'maicon159951@gmail.com',
            imageUrl: null,
            turn: '',
            id: 1),
      ),
    ];
  }

  Future<List<RepresentativeModel>> getRepresentatives() async {
    return <RepresentativeModel>[
      RepresentativeModel(
          name: 'Michael Alves Pereira',
          area: 'Programação web',
          email: 'maicon159951@gmail.com',
          imageUrl: null,
          turn: '',
          id: 1),
    ];
  }
}

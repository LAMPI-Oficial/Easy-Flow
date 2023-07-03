import 'package:easyflow/layers/domain/entities/representative_entity.dart';

class AnnouncementsEntity {
  final String? urlPhoto;
  final String description;
  final RepresentativeEntity representative;
  AnnouncementsEntity( {this.urlPhoto,
    required this.description,
    required this.representative,
  });
}

import 'package:easyflow/layers/domain/entities/representative_model.dart';

class AnnouncementsModel {
  final String? urlPhoto;
  final String description;
  final RepresentativeModel representative;
  AnnouncementsModel( {this.urlPhoto,
    required this.description,
    required this.representative,
  });
}

import 'package:easyflow/layers/domain/entities/representative_entity.dart';

class RepresentativeDto extends RepresentativeEntity {
  RepresentativeDto(
      {required int id,
      required String name,
      required String email,
      required String studyArea,
      String imageUrl = ""})
      : super(
            id: id,
            email: email,
            name: name,
            studyArea: studyArea,
            imageUrl: imageUrl);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "study_area": studyArea,
        "url_photo": imageUrl,
      };

  static RepresentativeDto fromMap(Map map) {
    return RepresentativeDto(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      studyArea: map["study_area"],
      imageUrl: map["url_photo"],
    );
  }
}

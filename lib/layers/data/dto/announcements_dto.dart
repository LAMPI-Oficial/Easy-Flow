import 'package:easyflow/layers/domain/entities/announcements_entity.dart';

class AnnouncementsDto extends AnnouncementsEntity {
  AnnouncementsDto(
      {required int id,
      required String description,
      // required RepresentativeEntity representative,
      urlPhoto = ""})
      : super(
            id: id,
            description: description,
            // representative: representative,
            urlPhoto: urlPhoto);

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "urlPhoto": urlPhoto,
        // "representative": representative,
      };

  static AnnouncementsDto fromMap(Map map) {
    return AnnouncementsDto(
      id: map["id"],
      description: map["description"],
      urlPhoto: map["urlPhoto"],
      // representative: RepresentativeEntity(
      //     id: 1,
      //     name: "name",
      //     imageUrl: "imageUrl",
      //     email: "email",
      //     studyArea: "studyArea"),
      // id: map['id'],
    );
  }
}

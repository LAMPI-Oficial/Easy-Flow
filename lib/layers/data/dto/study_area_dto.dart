import 'package:easyflow/layers/domain/entities/study_area_entity.dart';

class StudyAreaDto extends StudyAreaEntity {
  StudyAreaDto({required int id, required String name})
      : super(id: id, name: name);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
  };

  static StudyAreaDto fromMap(Map map) {
    return StudyAreaDto(
      id: map['id'],
      name: map['study_area_name'],
    );
  }
}

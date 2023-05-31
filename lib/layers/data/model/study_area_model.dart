class StudyAreaModel {
  int id;
  String name;

  StudyAreaModel({
    required this.id,
    required this.name,
  });

  static StudyAreaModel fromMap(Map map) {
    return StudyAreaModel(
      id: map["id"],
      name: map["study_area_name"],
    );
  }
}

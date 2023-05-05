class CourseModel {
  int id;
  String name;

  CourseModel({
    required this.id,
    required this.name,
  });

  static CourseModel fromMap(Map map) {
    return CourseModel(
      id: map["id"],
      name: map["course_name"],
    );
  }
}

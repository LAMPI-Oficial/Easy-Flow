import 'package:easyflow/layers/domain/entities/course_entity.dart';

class CourseDto extends CourseEntity {
  CourseDto({required int id, required String name})
      : super(id: id, name: name);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
  };

  static CourseDto fromMap(Map map) {
    return CourseDto(
      id: map['id'],
      name: map['course_name'],
    );
  }
}

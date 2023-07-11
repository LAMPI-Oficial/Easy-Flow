import 'package:easyflow/layers/domain/entities/complaint_entity.dart';

class ComplaintDto extends ComplaintEntity {
  ComplaintDto({required id, required description, required date})
      : super(
        id: id,
          description: description,
          date: date,
        );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
      };

  static ComplaintDto fromMap(Map map) {
    return ComplaintDto(
      id: map['id'],

      description: map['course_name'],
      date: map['date'],
    );
  }
}

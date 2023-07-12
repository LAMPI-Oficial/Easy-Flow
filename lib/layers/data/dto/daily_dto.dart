import 'package:easyflow/layers/domain/entities/daily_entity.dart';

class DailyDto extends DailyEntity {
  DailyDto({required id, required description, required date})
      : super(
          id: id,
          description: description,
          date: date,
        );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
      };

  static DailyDto fromMap(Map map) {
    return DailyDto(
      id: map['id'] as int,
      description: map['description'],
      date: DateTime.parse(map['created_in']),
    );
  }
}

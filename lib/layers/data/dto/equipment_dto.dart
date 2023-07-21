import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

class EquipmentDto extends EquipmentEntity {
  EquipmentDto({
    required super.id,
    required super.date,
    required super.status,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "status": status,
      };

  static EquipmentDto fromMap(Map map) {
    return EquipmentDto(
      id: map['id'],
      date: map['date'],
      status: map['status'],
    );
  }
}

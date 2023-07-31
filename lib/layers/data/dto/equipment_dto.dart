import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

class EquipmentDto extends EquipmentEntity {
  EquipmentDto({
    required super.id,
    required super.date,
    required super.status,
    required super.idRepresentative,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "status": status,
        'id_representative' : idRepresentative,
      };

  static EquipmentDto fromMap(Map map) {
    return EquipmentDto(
      id: map['id'],
      date: map['created_at'],
      status: map['status'],
      idRepresentative: map['id_representative'],
    );
  }
}

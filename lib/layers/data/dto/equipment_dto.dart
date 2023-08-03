import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

class EquipmentDto extends EquipmentEntity {
  EquipmentDto({
    super.id,
    required super.date,
    required super.status,
    required super.idRepresentative,
    required super.dateRequest,
    required super.dateReturn,
    required super.justify,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": date,
        "status": status,
        'id_representative': idRepresentative,
        'date_request': dateRequest,
        'date_return': dateReturn,
        'justify': justify,
      };

  static EquipmentDto fromMap(Map map) {
    return EquipmentDto(
      id: map['id'],
      date: map['created_at'],
      status: map['status'],
      idRepresentative: map['id_representative'],
      dateRequest: map['date_request'],
      dateReturn: map['date_return'],
      justify: map['justify'],
    );
  }
}

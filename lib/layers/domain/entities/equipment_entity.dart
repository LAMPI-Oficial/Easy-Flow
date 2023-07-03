import 'package:easyflow/layers/domain/entities/enums/status_enum.dart';
import 'package:intl/intl.dart';

class EquipmentEntity {
  final int id;
  final DateTime date;
  final Status status;

  EquipmentEntity({
    required this.id,
    required this.date,
    required this.status,
  });

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(date)} de ${DateFormat('MMMM yyyy', 'pt_BR').format(date)}";
  }
}

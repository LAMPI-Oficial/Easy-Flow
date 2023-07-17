import 'package:easyflow/layers/domain/entities/enums/status_enum.dart';
import 'package:intl/intl.dart';

class EquipmentEntity {
  final int id;
  final String date;
  final Status status;

  EquipmentEntity({
    required this.id,
    required this.date,
    required this.status,
  });

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(DateTime.parse(date))} de ${DateFormat('MMMM yyyy', 'pt_BR').format(DateTime.parse(date))}";
  }
}

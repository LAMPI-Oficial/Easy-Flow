import 'package:easyflow/layers/data/model/enums/status_enum.dart';
import 'package:intl/intl.dart';

class EquipmentModel {
  final int id;
  final DateTime date;
  final Status status;

  EquipmentModel({
    required this.id,
    required this.date,
    required this.status,
  });

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(date)} de ${DateFormat('MMMM yyyy', 'pt_BR').format(date)}";
  }
}

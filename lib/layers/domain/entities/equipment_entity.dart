import 'package:easyflow/layers/domain/entities/enums/status_enum.dart';
import 'package:intl/intl.dart';

class EquipmentEntity {
  final int? id;
  final String date;
  final String status;
  final int idRepresentative;
  final String dateRequest;
  final String dateReturn;
  final String justify;

  EquipmentEntity({
    this.id,
    required this.date,
    required this.status,
    required this.idRepresentative,
    required this.dateRequest,
    required this.dateReturn,
    required this.justify,
  });

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(DateTime.parse(date))} de ${DateFormat('MMMM yyyy', 'pt_BR').format(DateTime.parse(date))}";
  }

  Status get statusFormatted {
    if (status == "APPROVED") {
      return Status.APPROVED;
    } else if (status == "DISAPPROVED") {
      return Status.DISAPPROVED;
    } else {
      return Status.PENDING;
    }
  }
}

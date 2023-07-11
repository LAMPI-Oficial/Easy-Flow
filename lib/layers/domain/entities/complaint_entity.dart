import 'package:intl/intl.dart';

class ComplaintEntity {
  final int id;
  final String description;
  final DateTime date;

  ComplaintEntity( {required this.id,
    required this.description,
    required this.date,
  });

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(date)} de ${DateFormat('MMMM yyyy', 'pt_BR').format(date)}";
  }
}

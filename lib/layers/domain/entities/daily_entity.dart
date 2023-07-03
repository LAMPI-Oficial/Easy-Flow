import 'package:intl/intl.dart';

class DailyEntity {
  final int id;
  final DateTime date;
  DailyEntity({required this.id, required this.date});

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(date)} de ${DateFormat('MMMM yyyy', 'pt_BR').format(date)}";
  }

}

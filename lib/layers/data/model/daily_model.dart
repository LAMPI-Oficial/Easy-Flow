import 'package:intl/intl.dart';

class DailyModel {
  final int id;
  final DateTime date;
  DailyModel({required this.id, required this.date});

  String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(date)} de ${DateFormat('MMMM yyyy', 'pt_BR').format(date)}";
  }

  Map toMap() {
    return {
      'id': id,
      'date': date,
    };
  }

  static DailyModel fromMap(Map map) {
    return DailyModel(
      id: map['id'],
      date: map['date'],
    );
  }
}

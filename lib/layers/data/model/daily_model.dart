import 'package:intl/intl.dart';

class DailyModel {
  final int id;
  final DateTime date;
  DailyModel({required this.id, required this.date});

  String get formattedData {
    return DateFormat('dd "de" MMMM yyyy', 'pt_BR').format(date).toString();
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

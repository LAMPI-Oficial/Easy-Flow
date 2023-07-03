import 'package:intl/intl.dart';

class ComplaintModel {
  final String description;
   final DateTime date;

  ComplaintModel( {required this.description, required this.date,});

   String get formattedData {
    return "${DateFormat('dd', 'pt_BR').format(date)} de ${DateFormat('MMMM yyyy', 'pt_BR').format(date)}";
  }
}

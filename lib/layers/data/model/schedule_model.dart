

class ScheduleModel {
  int id;
  String name;
  int numTable;
  String day;
  String turn;

  ScheduleModel({
    required this.id,
    required this.name,
    required this.day,
    required this.numTable,
    required this.turn,
  });

  static ScheduleModel fromMap(Map map) {
    return ScheduleModel(
      id: map['id'],
      name: map['name'],
      numTable: map['numTable'],
      day: map['day'],
      turn: map['turn'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'day': day,
      'numTable': numTable,
      'turn': turn,
    };
  }
}

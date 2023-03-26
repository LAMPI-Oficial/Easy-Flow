class HoraryModel {
  int id;
  String name;
  int numTable;
  String day;
  String turn;

  HoraryModel({
    required this.id,
    required this.name,
    required this.day,
    required this.numTable,
    required this.turn,
  });
}

List<HoraryModel> objects = [
  HoraryModel(
    id: 0,
    name: "Larissa Silva",
    day: "Terça-feira",
    numTable: 1,
    turn: "Tarde",
  ),
  HoraryModel(
    id: 0,
    name: "Lucas Correa",
    day: "Segunda-feira",
    numTable: 12,
    turn: "Manhã",
  ),
  HoraryModel(
    id: 0,
    name: "Lucas Correa",
    day: "Segunda-feira",
    numTable: 12,
    turn: "Manhã",
  ),
];

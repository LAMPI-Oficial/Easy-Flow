class RepresentativeModel {
  int id;
  String name;
  String? imageUrl;
  String email;
  String area;
  String turn;
  RepresentativeModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.email,
    required this.area,
    required this.turn,
  });

    static RepresentativeModel fromMap(Map map) {
    return RepresentativeModel(
      id: map['id'],
      name: map['name'],
     area: map['area'],
     email: map['email'],
     imageUrl: map['imageUrl'],
      turn: map['turn'],
    );
  }

}

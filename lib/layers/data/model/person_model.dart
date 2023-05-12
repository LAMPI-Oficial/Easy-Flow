class PersonModel {
  int? id;
  String? name;
  String? email;


  PersonModel({
    required this.id,
    required this.name,
    required this.email,
  });

  static PersonModel fromMap(Map map) {
    return PersonModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  String get alias {
    List<String> split = name!.split(" ");

    return split.isNotEmpty
        ? split.length > 1
            ? split[0][0] + split[1][0]
            : split[0][0]
        : "";
  }
}

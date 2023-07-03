import 'package:easyflow/layers/domain/entities/enums/person_type_enum.dart';

class PersonEntity {
  int id;
  String? urlPhoto;
  String name;
  String email;
  bool admin;
  PersonType personType;


  PersonEntity({
    required this.id,
    required this.urlPhoto,
    required this.name,
    required this.email,
    required this.admin,
    required this.personType,

  });

  String get alias {
    List<String> split = name.split(" ");

    return split.isNotEmpty
        ? split.length > 1
            ? split[0][0] + split[1][0]
            : split[0][0]
        : "";
  }
}

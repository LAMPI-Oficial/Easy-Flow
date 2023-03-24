import 'package:easyflow/layers/data/model/person_model.dart';

class UserModel {
  int id;
  String token;
  String login;
  bool active;
  PersonModel person;

  UserModel({
    required this.id,
    required this.token,
    required this.login,
    required this.active,
    required this.person,
  });

  static UserModel fromMap(Map map) {
    return UserModel(
      id: map["user"]["id"],
      token: map["token"]["value"],
      login: map['user']['login'],
      active: map['user']['active'],
      person: PersonModel.fromMap(
        map['user']['person'],
      ),
    );
  }
}

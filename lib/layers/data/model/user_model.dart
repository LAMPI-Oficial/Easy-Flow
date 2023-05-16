import 'package:easyflow/layers/data/model/person_model.dart';

class UserModel {
  int id;
  String token;
  String login;
  PersonModel person;

  UserModel({
    required this.id,
    required this.token,
    required this.login,
    required this.person,
  });

  static UserModel fromMap(Map map) {
    return UserModel(
      id: map["user"]["id"],
      token: map["token"]["value"],
      login: map['user']['login'],
      person: PersonModel.fromMap(
        map['user']['tb_person'],
      ),
    );
  }
}

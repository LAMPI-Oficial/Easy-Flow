import 'package:easyflow/layers/data/model/person_model.dart';

class UserModel {
  int id;
  String token;
  String login;
  PersonModel personModel;

  UserModel({
    required this.id,
    required this.token,
    required this.login,
    required this.personModel,
  });

  static UserModel fromMap(Map map) {
    return UserModel(
      id: map["user"]["id"],
      token: map["token"]["value"],
      login: map['user']['login'],
      personModel: PersonModel.fromMap(
        map['user']['tb_person'],
      ),
    );
  }
}

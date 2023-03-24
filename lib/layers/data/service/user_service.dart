import 'package:easyflow/layers/data/model/user_model.dart';

class UserService {
  UserModel? _userLogged;
  bool logged = false;

  auth(UserModel userModel) {
    _userLogged = userModel;
    logged = true;
  }

  logout() {
    _userLogged = null;
    logged = false;
  }

  UserModel get userLogged => _userLogged!;
}

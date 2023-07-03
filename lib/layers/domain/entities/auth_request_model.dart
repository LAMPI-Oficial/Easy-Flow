class AuthRequestModel {
  String login;
  String password;

  AuthRequestModel({
    required this.login,
    required this.password,
  });

  Map toMap() {
    return {
      'login': login,
      'password': password,
    };
  }
}

class AuthRequestDto {
  String login;
  String password;

  AuthRequestDto({
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

class IncorrectLoginOrPasswordException implements Exception {
  String cause = "Login e/ou Senha incorretos";
}

class IncorrectSignUpException implements Exception {
  String cause = "Erro ao cadastrar usuário";
}


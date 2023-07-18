class ForgotPasswordSendPasswordEntity {
  final int id;
  final String password;
  final String repeatPassword;

  ForgotPasswordSendPasswordEntity({
    required this.id,
    required this.password,
    required this.repeatPassword,
  });
}

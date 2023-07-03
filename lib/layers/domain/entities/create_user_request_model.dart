class CreateUserRequestModel {
  String name;
  String email;
  String phone;
  String password;
  String repeatPassword;


  CreateUserRequestModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.repeatPassword,
});

 Map toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'repeat_password': repeatPassword,
    };
  }
}

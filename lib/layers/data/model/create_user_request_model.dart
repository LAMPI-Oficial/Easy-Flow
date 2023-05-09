class CreateUserRequestModel {
  String name;
  String email;
  String phone;
  String password;
  String repeatPassword;
  String course;
  String studyArea;

  CreateUserRequestModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.repeatPassword,
      required this.course,
      required this.studyArea});

  Map toMap() {
    return {
      "course_id": int.parse(course),
      "email": email,
      "name": name,
      "password": password,
      "phone": phone,
      "repeated_password": repeatPassword,
      "study_area_id": int.parse(studyArea),
    };
  }
}

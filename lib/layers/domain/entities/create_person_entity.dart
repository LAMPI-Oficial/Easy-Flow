import 'package:easyflow/layers/domain/entities/address_entity.dart';

class CreatePersonEntity {
  String name;
  String email;
  String phone;
  String password;
  String repeatPassword;
  int courseId;
  int studyAreaId;
  AddressEntity address;

  CreatePersonEntity(
      {required this.name,
      required this.email,
      required this.phone,
      required this.courseId,
      required this.studyAreaId,
      required this.address,
      required this.password,
      required this.repeatPassword,
     });
}

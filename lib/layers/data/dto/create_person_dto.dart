import 'package:easyflow/layers/domain/entities/address_entity.dart';
import 'package:easyflow/layers/domain/entities/create_person_entity.dart';

class CreatePersonRequestDto extends CreatePersonEntity {
  CreatePersonRequestDto({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String repeatPassword,
    required int courseId,
    required int studyAreaId,
    required AddressEntity address,
  }) : super(
          name: name,
          email: email,
          phone: phone,
          password: password,
          repeatPassword: repeatPassword,
          courseId: courseId,
          studyAreaId: studyAreaId,
          address: address,
        );

  Map toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'repeated_password': repeatPassword,
    };
  }
}

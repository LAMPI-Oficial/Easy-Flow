import '../../domain/entities/create_person_entity.dart';

class CreatePersonRequestDto {
  CreatePersonEntity createPersonEntity;

  CreatePersonRequestDto({
    required this.createPersonEntity,
  });

  Map toMap() {
    return {
      'name': createPersonEntity.name,
      'email': createPersonEntity.email,
      'phone': createPersonEntity.phone,
      'password': createPersonEntity.password,
      'repeated_password': createPersonEntity.repeatPassword,
    };
  }
}

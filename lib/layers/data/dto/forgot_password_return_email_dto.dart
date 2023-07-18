import 'package:easyflow/layers/domain/entities/forgot_password_return_email_entity.dart';

class ForgotPasswordReturnEmailRequestDto
    extends ForgotPasswordReturnEmailEntity {
  ForgotPasswordReturnEmailRequestDto({
    required int id,
  }) : super(id: id);

  static ForgotPasswordReturnEmailRequestDto fromMap(Map map) {
    return ForgotPasswordReturnEmailRequestDto(
      id: map['id'],
    );
  }
}

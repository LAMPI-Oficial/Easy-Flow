import 'package:easyflow/layers/domain/entities/forgot_password_send_email_entity.dart';

class ForgotPasswordSendEmailRequestDto {
  ForgotPasswordSendEmailEntity forgotPasswordSendEmailEntity;

  ForgotPasswordSendEmailRequestDto({
    required this.forgotPasswordSendEmailEntity,
  });

  Map toMap() {
    return {
      'email': forgotPasswordSendEmailEntity.email,
    };
  }
}

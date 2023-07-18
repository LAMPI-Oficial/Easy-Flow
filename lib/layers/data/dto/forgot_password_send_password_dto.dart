import 'package:easyflow/layers/domain/entities/forgot_password_send_password_entity.dart';

class ForgotPasswordSendPasswordRequestDto {
  ForgotPasswordSendPasswordEntity forgotPasswordSendPasswordEntity;

  ForgotPasswordSendPasswordRequestDto({
    required this.forgotPasswordSendPasswordEntity,
  });

  Map toMap() {
    return {
      'id': forgotPasswordSendPasswordEntity.id,
      'password': forgotPasswordSendPasswordEntity.password,
      'repeat_password': forgotPasswordSendPasswordEntity.repeatPassword,
    };
  }
}

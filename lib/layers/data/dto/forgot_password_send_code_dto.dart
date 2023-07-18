import 'package:easyflow/layers/domain/entities/forgot_password_send_code_entity.dart';

class ForgotPasswordSendCodeRequestDto {
  ForgotPasswordSendCodeEntity forgotPasswordSendCodeEntity;

  ForgotPasswordSendCodeRequestDto({
    required this.forgotPasswordSendCodeEntity,
  });

  Map toMap() {
    return {
      'id': forgotPasswordSendCodeEntity.id,
      'code': forgotPasswordSendCodeEntity.code,
    };
  }
}

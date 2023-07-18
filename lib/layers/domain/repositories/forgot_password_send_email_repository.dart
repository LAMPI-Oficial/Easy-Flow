import 'package:easyflow/layers/domain/entities/forgot_password_return_email_entity.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_email_entity.dart';

abstract class ForgotPasswordSendEmailRepository {
  Future<ForgotPasswordReturnEmailEntity> call(
      ForgotPasswordSendEmailEntity forgotPasswordSendEmailEntity);
}

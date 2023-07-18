import 'package:easyflow/layers/domain/entities/forgot_password_send_password_entity.dart';

abstract class ForgotPasswordSendPasswordDatasource {
  Future<bool> call(
      ForgotPasswordSendPasswordEntity forgotPasswordSendPasswordEntity);
}

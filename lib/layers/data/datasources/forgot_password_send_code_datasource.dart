import 'package:easyflow/layers/domain/entities/forgot_password_send_code_entity.dart';

abstract class ForgotPasswordSendCodeDatasource {
  Future<bool> call(ForgotPasswordSendCodeEntity forgotPasswordSendCodeEntity);
}

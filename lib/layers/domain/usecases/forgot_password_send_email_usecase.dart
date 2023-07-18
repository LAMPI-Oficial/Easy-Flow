import 'package:easyflow/layers/domain/entities/forgot_password_return_email_entity.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_email_entity.dart';
import 'package:easyflow/layers/domain/repositories/forgot_password_send_email_repository.dart';

abstract class ForgotPasswordSendEmailUseCase {
  Future<ForgotPasswordReturnEmailEntity> call(
      ForgotPasswordSendEmailEntity forgotPasswordSendEmailEntity);
}

class ForgotPasswordSendEmailUseCaseImpl
    implements ForgotPasswordSendEmailUseCase {
  final ForgotPasswordSendEmailRepository _forgotPasswordSendEmailRepository;

  ForgotPasswordSendEmailUseCaseImpl(this._forgotPasswordSendEmailRepository);
  @override
  Future<ForgotPasswordReturnEmailEntity> call(
      ForgotPasswordSendEmailEntity forgotPasswordSendEmailEntity) async {
    return _forgotPasswordSendEmailRepository(forgotPasswordSendEmailEntity);
  }
}

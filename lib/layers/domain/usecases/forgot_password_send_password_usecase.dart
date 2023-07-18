import 'package:easyflow/layers/domain/entities/forgot_password_send_password_entity.dart';
import 'package:easyflow/layers/domain/repositories/forgot_password_send_password_repository.dart';

abstract class ForgotPasswordSendPasswordUseCase {
  Future<bool> call(
      ForgotPasswordSendPasswordEntity forgotPasswordSendPasswordEntity);
}

class ForgotPasswordSendPasswordUseCaseImpl
    implements ForgotPasswordSendPasswordUseCase {
  final ForgotPasswordSendPasswordRepository
      _forgotPasswordSendPasswordRepository;

  ForgotPasswordSendPasswordUseCaseImpl(
      this._forgotPasswordSendPasswordRepository);
  @override
  Future<bool> call(
      ForgotPasswordSendPasswordEntity forgotPasswordSendPasswordEntity) async {
    return _forgotPasswordSendPasswordRepository(
        forgotPasswordSendPasswordEntity);
  }
}

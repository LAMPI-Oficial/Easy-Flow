import 'package:easyflow/layers/domain/entities/forgot_password_send_code_entity.dart';
import 'package:easyflow/layers/domain/repositories/forgot_password_send_code_repository.dart';

abstract class ForgotPasswordSendCodeUseCase {
  Future<bool> call(ForgotPasswordSendCodeEntity forgotPasswordSendCodeEntity);
}

class ForgotPasswordSendCodeUseCaseImpl
    implements ForgotPasswordSendCodeUseCase {
  final ForgotPasswordSendCodeRepository _forgotPasswordSendCodeRepository;

  ForgotPasswordSendCodeUseCaseImpl(this._forgotPasswordSendCodeRepository);
  @override
  Future<bool> call(
      ForgotPasswordSendCodeEntity forgotPasswordSendCodeEntity) async {
    return _forgotPasswordSendCodeRepository(forgotPasswordSendCodeEntity);
  }
}

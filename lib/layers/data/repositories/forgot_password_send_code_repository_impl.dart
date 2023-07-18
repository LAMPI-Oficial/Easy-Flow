import 'package:easyflow/layers/data/datasources/forgot_password_send_code_datasource.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_code_entity.dart';
import 'package:easyflow/layers/domain/repositories/forgot_password_send_code_repository.dart';

class ForgotPasswordSendCodeImpl implements ForgotPasswordSendCodeRepository {
  final ForgotPasswordSendCodeDatasource _forgotPasswordSendCodeDatasource;

  ForgotPasswordSendCodeImpl(this._forgotPasswordSendCodeDatasource);
  @override
  Future<bool> call(
      ForgotPasswordSendCodeEntity forgotPasswordSendCodeEntity) async {
    return _forgotPasswordSendCodeDatasource(forgotPasswordSendCodeEntity);
  }
}

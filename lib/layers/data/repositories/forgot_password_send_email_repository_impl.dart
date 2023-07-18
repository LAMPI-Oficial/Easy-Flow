import 'package:easyflow/layers/data/datasources/forgot_password_send_email_datasource.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_return_email_entity.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_email_entity.dart';
import 'package:easyflow/layers/domain/repositories/forgot_password_send_email_repository.dart';

class ForgotPasswordSendEmailImpl implements ForgotPasswordSendEmailRepository {
  final ForgotPasswordSendEmailDatasource _forgotPasswordSendEmailDatasource;

  ForgotPasswordSendEmailImpl(this._forgotPasswordSendEmailDatasource);
  @override
  Future<ForgotPasswordReturnEmailEntity> call(
      ForgotPasswordSendEmailEntity forgotPasswordSendEmailEntity) async {
    return _forgotPasswordSendEmailDatasource(forgotPasswordSendEmailEntity);
  }
}

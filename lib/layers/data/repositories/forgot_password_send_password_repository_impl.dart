import 'package:easyflow/layers/data/datasources/forgot_password_send_password_datasource.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_password_entity.dart';
import 'package:easyflow/layers/domain/repositories/forgot_password_send_password_repository.dart';

class ForgotPasswordSendPasswordImpl
    implements ForgotPasswordSendPasswordRepository {
  final ForgotPasswordSendPasswordDatasource
      _forgotPasswordSendPasswordDatasource;

  ForgotPasswordSendPasswordImpl(this._forgotPasswordSendPasswordDatasource);
  @override
  Future<bool> call(
      ForgotPasswordSendPasswordEntity forgotPasswordSendPasswordEntity) async {
    return _forgotPasswordSendPasswordDatasource(
        forgotPasswordSendPasswordEntity);
  }
}

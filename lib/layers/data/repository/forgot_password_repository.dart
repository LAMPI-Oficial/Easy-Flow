import 'package:easyflow/layers/data/provider/forgot_password_provider.dart';

class ForgotPasswordRepository {
  final ForgotPasswordProvider _forgotPasswordProvider;

  ForgotPasswordRepository(this._forgotPasswordProvider);

  Future<String> forgot(String email) {
    return _forgotPasswordProvider.forgot(email);
  }
}

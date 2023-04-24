import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/layers/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthProvider _authProvider;

  AuthRepository(this._authProvider);

  Future<UserModel> login(AuthRequestModel authRequestModel) {
    return _authProvider.login(authRequestModel);
  }

  Future<UserModel> signUp(CreateUserRequestModel createUserRequestModel) {
    return _authProvider.signUp(createUserRequestModel);
  }
}

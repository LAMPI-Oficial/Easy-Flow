import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/layers/data/provider/auth_provider.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepository {
  final AuthProvider _authProvider;

  AuthRepository(this._authProvider);

  AsyncResult<UserModel, Exception> login(AuthRequestModel authRequestModel) {
    return _authProvider.login(authRequestModel);
  }

    AsyncResult<UserModel, Exception> signUp(CreateUserRequestModel createUserRequestModel) {
    return _authProvider.signUp(createUserRequestModel);
  }
}

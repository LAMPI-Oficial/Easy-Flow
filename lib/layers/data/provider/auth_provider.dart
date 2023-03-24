import 'dart:convert';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/custom_exceptions.dart';
import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:result_dart/result_dart.dart';
import 'package:easyflow/core/config/api_config.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  AsyncResult<UserModel, Exception> login(
      AuthRequestModel authRequestModel) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.getUrl(ApiConfig.urlEndPointAuth)),
        body: jsonEncode(
          authRequestModel.toMap(),
        ),
        headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
      );
      return Success(
        UserModel.fromMap(
          jsonDecode(
            response.body,
          ),
        ),
      );
    } catch (e) {
      return Failure(
        IncorrectLoginOrPasswordException(),
      );
    }
  }

  AsyncResult<UserModel, Exception> signUp(
      CreateUserRequestModel createUserRequestModel) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.getUrl(ApiConfig.urlEndPointCreateUser)),
        body: jsonEncode(createUserRequestModel.toMap()),
        headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
      );
      return Success(
        UserModel.fromMap(
          jsonDecode(
            response.body,
          ),
        ),
      );
    } catch (e) {
      return Failure(
        IncorrectSignUpException(),
      );
    }
  }
}

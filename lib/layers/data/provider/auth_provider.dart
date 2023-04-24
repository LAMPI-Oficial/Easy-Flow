import 'dart:convert';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/core/config/api_config.dart';
import 'package:get/get_connect.dart';

class AuthProvider extends GetConnect {
  Future<UserModel> login(AuthRequestModel authRequestModel) async {
    final response = await post(
      ApiConfig.getUrl(ApiConfig.urlEndPointAuth),
      authRequestModel.toMap(),
      headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromMap(
       
          response.body,
     
      );
    } else if (response.statusCode == 401) {
      throw ApiException('Credenciais Invalidas', 'Verifique suas Credenciais');
    } else {
      throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
    }
  }

  Future<UserModel> signUp(
      CreateUserRequestModel createUserRequestModel) async {
    final response = await post(
      ApiConfig.getUrl(ApiConfig.urlEndPointCreateUser),
      createUserRequestModel.toMap(),
      headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromMap(
        
          response.body,
        
      );
    } else if (response.statusCode == 409) {
      throw ApiException('Essa conta já existe', 'use outro email ou cpf');
    } else if (response.statusCode == 400) {
      throw ApiException('Erro ao cadastrar-se', 'as senhas não correspondem');
    } else {
      throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
    }
  }
}

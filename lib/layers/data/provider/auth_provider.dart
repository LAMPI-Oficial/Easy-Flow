import 'dart:async';

import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/core/config/api_config.dart';
import 'package:get/get_connect.dart';

class AuthProvider extends GetConnect {
  // Método privado para lançar ApiException com as mensagens de erro apropriadas

  // Método de login
  Future<UserModel?> login(AuthRequestModel authRequestModel) async {
    try {
      final response = await post(
        ApiConfig.getUrl(ApiConfig.urlEndPointAuth),
        authRequestModel.toMap(),
        headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromMap(
          response.body,
        );
      } else if (response.statusCode == 401) {
        _throwApiException(
            'Credenciais Invalidas', 'Verifique suas Credenciais');
      } else {
        _throwApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      _throwApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
    return null;
  }

  // Método de registro
  Future<UserModel?> signUp(
      CreateUserRequestModel createUserRequestModel) async {
    try {
      final response = await post(
        ApiConfig.getUrl(ApiConfig.urlEndPointCreateUser),
        createUserRequestModel.toMap(),
        headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromMap(
          response.body,
        );
      } else if (response.statusCode == 409) {
        _throwApiException('Essa conta já existe', 'Use outro email ou cpf');
      } else if (response.statusCode == 400) {
        _throwApiException(
            'Erro ao cadastrar-se', 'As senhas não correspondem');
      } else {
        _throwApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      _throwApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
    return null;
  }

  // Método privado para lançar ApiException com as mensagens de erro apropriadas
  void _throwApiException(String title, String message) {
    throw ApiException(title, message);
  }
}
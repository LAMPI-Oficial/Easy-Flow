import 'dart:async';
import 'dart:io';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/authenticate_user_datasource.dart';
import 'package:easyflow/layers/data/dto/auth_request_dto.dart';
import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthenticateUserDatasourceImpl implements AuthenticateUserDatasource {
  @override
  Future<UserEntity> call(String login, String password) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiConfig.getUrl(ApiConfig.urlEndPointAuth)),
            body: jsonEncode(
              AuthRequestDto(
                login: login,
                password: password,
              ).toMap(),
            ),
            headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.body);
      if (response.statusCode == 200) {
        return UserDto.fromMap(
          jsonDecode(
            response.body,
          ),
        );
      } else if (response.statusCode == 401) {
        throw ApiException(
            'Credenciais Invalidas', 'Verifique suas Credenciais');
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação',
          'Servidor indisponível, Tente novamente');
    } on SocketException catch (_) {
      throw ApiException('Sem conexão com a internet', 'Conecte à internet');
    } on Exception catch (_) {
      if (_ is ApiException) {
        rethrow;
      }
      throw ApiException('Erro desconhecido', 'Contacte o administrador.');
    }
  }
}

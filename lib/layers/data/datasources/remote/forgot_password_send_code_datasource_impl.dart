import 'dart:async';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/forgot_password_send_code_datasource.dart';
import 'package:easyflow/layers/data/dto/forgot_password_send_code_dto.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_code_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordSendCodeDatasourceImpl
    implements ForgotPasswordSendCodeDatasource {
  @override
  Future<bool> call(
      ForgotPasswordSendCodeEntity forgotPasswordSendCodeEntity) async {
    try {
      final response = await http
          .post(
            Uri.parse(
                ApiConfig.getUrl(ApiConfig.urlEndPointForgotPasswordSendCode)),
            body: jsonEncode(
              ForgotPasswordSendCodeRequestDto(
                      forgotPasswordSendCodeEntity:
                          forgotPasswordSendCodeEntity)
                  .toMap(),
            ),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );

      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

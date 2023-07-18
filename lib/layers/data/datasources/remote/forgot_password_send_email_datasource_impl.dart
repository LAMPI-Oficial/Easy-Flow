import 'dart:async';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/forgot_password_send_email_datasource.dart';
import 'package:easyflow/layers/data/dto/forgot_password_return_email_dto.dart';
import 'package:easyflow/layers/data/dto/forgot_password_send_email-dto.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_return_email_entity.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_email_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordSendEmailDatasourceImpl
    implements ForgotPasswordSendEmailDatasource {
  @override
  Future<ForgotPasswordReturnEmailEntity> call(
      ForgotPasswordSendEmailEntity forgotPasswordSendEmailEntity) async {
    try {
      final response = await http
          .post(
            Uri.parse(
                ApiConfig.getUrl(ApiConfig.urlEndPointForgotPasswordSendEmail)),
            body: jsonEncode(
              ForgotPasswordSendEmailRequestDto(
                      forgotPasswordSendEmailEntity:
                          forgotPasswordSendEmailEntity)
                  .toMap(),
            ),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );

      print(response.body);
      if (response.statusCode == 200) {
        return ForgotPasswordReturnEmailRequestDto.fromMap(
          jsonDecode(
            response.body,
          ),
        );
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

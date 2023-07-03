import 'dart:async';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../domain/entities/create_person_entity.dart';
import '../../dto/create_person_dto.dart';
import '../create_person_datasource.dart';

class CreatePersonDatasourceImpl implements CreatePersonDatasource {
  @override
  Future<UserEntity> call(CreatePersonEntity createPersonEntity) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiConfig.getUrl(ApiConfig.urlEndPointCreateUser)),
            body: jsonEncode(
              CreatePersonRequestDto(createPersonEntity: createPersonEntity)
                  .toMap(),
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
      } else if (response.statusCode == 409) {
        throw ApiException('Essa conta já existe', 'use outro email ou cpf');
      } else if (response.statusCode == 400) {
        throw ApiException(
            'Erro ao cadastrar-se', 'as senhas não correspondem');
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

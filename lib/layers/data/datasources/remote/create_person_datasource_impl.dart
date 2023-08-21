import 'dart:async';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/create_person_datasource.dart';
import 'package:easyflow/layers/data/dto/create_person_dto.dart';
import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePersonDatasourceImpl implements CreatePersonDatasource {
  @override
  Future<UserEntity> call(CreatePersonEntity createPersonEntity) async {
    final url = ApiConfig.getUrl(ApiConfig.urlEndPointCreateUser);

    try {
      print("chegou no create impl");
      print("Nome: ${createPersonEntity.name}");

      final response = await http
          .post(
            Uri.parse(url),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
            body: jsonEncode(
              CreatePersonRequestDto(
                name: createPersonEntity.name,
                email: createPersonEntity.email,
                phone: createPersonEntity.phone,
                password: createPersonEntity.password,
                repeatPassword: createPersonEntity.repeatPassword,
                courseId: createPersonEntity.courseId,
                studyAreaId: createPersonEntity.studyAreaId,
                address: createPersonEntity.address,
              ).toMap(),
            ),
          )
          .timeout(const Duration(seconds: 10));
      print("okay dokey");

      print(response.statusCode.toString());
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

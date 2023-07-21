import 'dart:async';
import 'dart:convert';

import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_user_datasource.dart';
import 'package:easyflow/layers/data/dto/study_area_dto.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/enums/person_type_enum.dart';
import 'package:easyflow/layers/domain/entities/person_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

class GetUserDataSourceImpl implements GetUserDataSource {
  @override
  Future<UserEntity> call() async {
    final url = ApiConfig.getUrl(ApiConfig.user);
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final valores = jsonDecode(response.body);

        return UserEntity(
          id: valores["id"],
          token: 'token',
          login: valores["login"],
          studyArea: StudyAreaDto(
            id: valores["studyArea_id"],
            name: valores["studyArea_name"],
          ),
          course: CourseEntity(
              id: valores["course_id"], name: valores["course_name"]),
          person: PersonEntity(
            id: valores["tb_person"]["id"],
            name: valores["tb_person"]["name"],
            email: valores["tb_person"]["email"],
            admin: valores["tb_person"]["person_admin"],
            urlPhoto: "",
            personType: PersonType.student,
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

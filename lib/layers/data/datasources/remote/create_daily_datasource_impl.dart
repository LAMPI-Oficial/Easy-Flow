import 'dart:async';

import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/create_daily_datasource.dart';
import 'package:easyflow/layers/data/dto/create_daily_dto.dart';
import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateDailyDatasourceImpl implements CreateDailyDatasource {
  @override
  Future<void> call(DailyEntity dailyEntity) async {
    try {
      print("chegou até aq");

      final response = await http
          .post(
            Uri.parse(ApiConfig.getUrl(ApiConfig.urlDailys)),
            body: jsonEncode(
              CreateDailyRequestDto(dailyEntity: dailyEntity).toMap(),
            ),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

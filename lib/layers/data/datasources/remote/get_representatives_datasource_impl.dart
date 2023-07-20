import 'dart:async';
import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_representatives_datasource.dart';
import 'package:easyflow/layers/data/dto/representatives_dto.dart';
import 'package:easyflow/layers/domain/entities/representative_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

class GetRepresentativesDataSourceImpl implements GetRepresentativesDataSource {
  @override
  Future<List<RepresentativeEntity>> call() async {
    final url = ApiConfig.getUrl(ApiConfig.urlRepresentatives);
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map(
              (i) => RepresentativeDto.fromMap(
                i,
              ),
            )
            .toList();
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

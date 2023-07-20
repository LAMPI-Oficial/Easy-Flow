import 'dart:async';
import 'dart:convert';

import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_announcements_datasource.dart';
import 'package:easyflow/layers/data/dto/announcements_dto.dart';
import 'package:easyflow/layers/domain/entities/announcements_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

class GetAnnouncementsDataSourceImpl implements GetAnnouncementsDataSource {
  @override
  Future<List<AnnouncementsEntity>> call() async {
    final url = ApiConfig.getUrl(ApiConfig.urlAnnouncements);
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
              (i) => AnnouncementsDto.fromMap(
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

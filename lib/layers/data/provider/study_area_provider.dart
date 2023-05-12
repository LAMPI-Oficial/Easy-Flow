import 'dart:async';

import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/layers/data/model/study_area_model.dart';
import 'package:get/get_connect.dart';

class StudyAreaProvider extends GetConnect {
  // Método para obter todos os horários da API
  Future<List<StudyAreaModel>> getAll() async {
    final url = ApiConfig.getUrl(ApiConfig.urlStudyArea);
    try {
      final response = await get(
        url,
        headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
      ).timeout(
        const Duration(seconds: 10),
      );
      //print(response.body);
      if (response.statusCode == 200) {
        return (response.body as List)
            .map(
              (i) => StudyAreaModel.fromMap(
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

import 'dart:convert';
import 'dart:async';

import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/post_equipments_datasource.dart';
import 'package:easyflow/layers/data/dto/equipment_dto.dart';
import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

class PostEquipmentsDataSourceImpl implements PostEquipmentsDataSource {
  @override
  Future<EquipmentEntity> call(EquipmentEntity data) async {
    final url = ApiConfig.getUrl(ApiConfig.urlEquipments);

    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(
              EquipmentDto(
                id: data.id,
                date: data.date,
                status: data.status,
                idRepresentative: data.idRepresentative,
                dateRequest: data.dateRequest,
                dateReturn: data.dateReturn,
                justify: data.justify,
              ).toMap(),
            ),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return EquipmentDto.fromMap(
          jsonDecode(
            response.body,
          ),
        );
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException(
        'Erro ao Realizar Operação ',
        'Servidor indisponível, Tente novamente',
      );
    }
  }
}

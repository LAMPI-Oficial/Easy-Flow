import 'dart:async';
import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_equipments_datasource.dart';
import 'package:easyflow/layers/data/dto/equipment_dto.dart';
import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

class GetEquipmentsDataSourceImpl implements GetEquipmentsDataSource {
  @override
  Future<List<EquipmentEntity>> call() async {
    final url = ApiConfig.getUrl(ApiConfig.urlEquipments);

    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map(
              (i) => EquipmentDto.fromMap(
                i,
              ),
            )
            .toList();
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

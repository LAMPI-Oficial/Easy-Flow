import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_dailys_datasource.dart';
import 'package:easyflow/layers/data/dto/daily_dto.dart';
import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:http/http.dart' as http;

class GetDailysDataSourceImpl implements GetDailysDataSource {
  @override
  Future<List<DailyEntity>> call() async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys);

    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
    );

    return (jsonDecode(response.body) as List)
        .map(
          (i) => DailyDto.fromMap(
        i,
      ),
    ).toList();
  }
}

import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_complaints_datasource.dart';
import 'package:easyflow/layers/data/dto/complaint_dto.dart';
import 'package:easyflow/layers/domain/entities/complaint_entity.dart';
import 'package:http/http.dart' as http;

class GetComplaintsDataSourceImpl implements GetComplaintsDataSource {
  @override
  Future<List<ComplaintEntity>> call() async {
    final url = ApiConfig.getUrl('/study_area');

    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
    );
    print(response.body);
    return (jsonDecode(response.body) as List)
        .map(
          (i) => ComplaintDto.fromMap(
            i,
          ),
        )
        .toList();
  }
}

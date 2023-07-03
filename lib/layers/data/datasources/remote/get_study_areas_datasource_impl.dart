import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_study_areas_datasource.dart';
import 'package:easyflow/layers/data/dto/study_area_dto.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:http/http.dart' as http;

class GetStudyAreasDataSourceImpl implements GetStudyAreasDataSource {
  @override
  Future<List<StudyAreaEntity>> call() async {
    final url = ApiConfig.getUrl(ApiConfig.urlStudyAreas);
    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
    );
    print(response.body);
    return (jsonDecode(response.body) as List)
        .map(
          (i) => StudyAreaDto.fromMap(
            i,
          ),
        )
        .toList();
  }
}

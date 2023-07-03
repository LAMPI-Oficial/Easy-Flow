import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/datasources/get_courses_datasource.dart';
import 'package:easyflow/layers/data/dto/course_dto.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:http/http.dart' as http;

class GetCoursesDataSourceImpl implements GetCoursesDataSource {
  @override
  Future<List<CourseEntity>> call() async {
    final url = ApiConfig.getUrl(ApiConfig.urlCourses);

    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
    );
    print(response.body);
    return (jsonDecode(response.body) as List)
        .map(
          (i) => CourseDto.fromMap(
            i,
          ),
        )
        .toList();
  }
}

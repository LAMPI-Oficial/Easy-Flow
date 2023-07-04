import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/dto/auth_request_dto.dart';
import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

//Teste de requisicição a api
void main() {
  //Autenticação
  Future<UserDto> auth() async {
    final response = await http.post(
      Uri.parse(ApiConfig.getUrl(ApiConfig.urlEndPointAuth)),
      body: jsonEncode(
        AuthRequestDto(
          login: 'user1@teste.com.br',
          password: '123456',
        ).toMap(),
      ),
      headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
    );
    return UserDto.fromMap(
      jsonDecode(
        response.body,
      ),
    );
  }

  // Teste para obter os cursos
  test('Get Courses', () async {
    final url = ApiConfig.getUrl(ApiConfig.urlCourses);
    String? token;
    await auth().then((value) => token = value.token);
    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithToken(token!),
    );
    expect(response.statusCode, 200);
    expect(response.body, '[{"id":1,"course_name":"ADS-1"}]');
  });

  // Teste para salvar um curso
  test('Save Course', () async {
    final url = ApiConfig.getUrl(ApiConfig.urlCourses);
    String? token;
    await auth().then((value) => token = value.token);
    final requestBody = jsonEncode({
      "id": 0,
      "name": "string",
      "person": [
        {
          "email": "string",
          "firtsName": "string",
          "id": 0,
          "lastName": "string",
          "name": "string",
          "person_admin": true,
          "person_representant": true,
          "phone": "string"
        }
      ]
    });

    final response = await http.post(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithToken(token!),
      body: requestBody,
    );

    expect(response.statusCode, 201);
    expect(json.decode(response.body), {"course_name": "string", "id": 0});
  });

  // Teste para obter um curso por ID
  test('Get Course by ID', () async {
    final id = 1;
    final url = ApiConfig.getUrl(ApiConfig.urlCourses) + id.toString();
    String? token;
    await auth().then((value) => token = value.token);
    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithToken(token!),
    );

    expect(response.statusCode, 200);
    expect(json.decode(response.body), {"course_name": "string", "id": 0});
  });

  // Teste para atualizar um curso por ID
  test('Update Course by ID', () async {
    final id = 1;
    final url = ApiConfig.getUrl(ApiConfig.urlCourses) + id.toString();
    final requestBody = jsonEncode({"course_name": "Teste"});
    String? token;
    await auth().then((value) => token = value.token);
    final response = await http.put(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithToken(token!),
      body: requestBody,
    );

    expect(response.statusCode, 200);
    expect(json.decode(response.body), {"course_name": "string", "id": 0});
  });

  // Teste para deletar um curso por ID
  test('Delete Course by ID', () async {
    final id = 1;
    final url = ApiConfig.getUrl(ApiConfig.urlCourses) + id.toString();
    String? token;
    await auth().then((value) => token = value.token);
    final response = await http.delete(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithToken(token!),
    );

    expect(response.statusCode, 200);
    expect(json.decode(response.body), {});
  });

  // Teste para pesquisar um curso por nome
  test('Search Course by Name', () async {
    final name = 'example';
    final url =
        '${ApiConfig.getUrl(ApiConfig.urlCourses)}/search_by_name?name=$name';
    String? token;
    await auth().then((value) => token = value.token);
    final response = await http.get(
      Uri.parse(url),
      headers: HttpHeadersConfig.buildHeadersWithToken(token!),
    );

    expect(response.statusCode, 200);
    expect(json.decode(response.body), {});
  });
}

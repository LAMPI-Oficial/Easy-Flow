import 'package:easyflow/core/config/api_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  // Teste para obter os dailys
  test('Get Dailys', () async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys);
  
    final response = await http.get(
      Uri.parse(url),
    );
    expect(response.statusCode, 200);
    print(response.body);
  });
}

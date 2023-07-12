import 'package:easyflow/core/config/api_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  // Teste para obter os complaints
  test('Get Complaints', () async {
    final url = ApiConfig.getUrl(ApiConfig.urlComplaints);
  
    final response = await http.get(
      Uri.parse(url),
    );
    expect(response.statusCode, 200);
    print(response.body);
  });
}

import 'dart:async';
import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:http/http.dart' as http;

class DailyProvider {
  Future<List<DailyModel>> getAll() async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys);
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
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map(
              (i) => DailyModel.fromMap(
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


  Future<DailyModel> getById(int id) async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys) + id.toString();
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

      if (response.statusCode == 200) {
        return DailyModel.fromMap(jsonDecode(response.body));
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

 
  Future<int> add(DailyModel horary) async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys);
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(horary.toMap()),
            headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      print(response.body);
      if (response.statusCode == 201) {
        return horary.id;
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

 
  Future<void> edit(DailyModel horary) async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys) + horary.id.toString();
    try {
      final response = await http.put(
       Uri.parse(url),body:
      jsonEncode(  horary.toMap()),
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode != 200) {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }


  Future<void> delete(int id) async {
    final url = ApiConfig.getUrl(ApiConfig.urlDailys) + id.toString();
    try {
      final response = await http.delete(
       Uri.parse(url),
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode != 200) {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

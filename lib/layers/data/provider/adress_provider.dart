import 'dart:async';

import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/model/create_adress_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/core/config/api_config.dart';
import 'package:get/get_connect.dart';

class AdressProvider extends GetConnect {
  // Método privado para lançar ApiException com as mensagens de erro apropriadas

  // Método de registro
  Future<String> save(
      CreateAdressRequestModel createAdressRequestModel) async {
    try {
      final response = await post(
        ApiConfig.getUrl(ApiConfig.urlEndPointCreateAdress),
        createAdressRequestModel.toMap(),
        headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print("Chegou no provider");
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return "ok";
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

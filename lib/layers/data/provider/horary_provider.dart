import 'dart:async';

import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/horary_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:get/get_connect.dart';

class HoraryProvider extends GetConnect {

  // Método para obter todos os horários da API
  Future<List<HoraryModel>> getAll(UserModel userModel) async {
    final url = ApiConfig.getUrl(ApiConfig.urlHorariesByRequester) +
        userModel.personModel.id.toString();
    try {
      final response = await get(
        url,
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return (response.body as List)
            .map(
              (i) => HoraryModel.fromMap(
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

// Método para obter um horário específico por ID da API
  Future<HoraryModel> getId(int id) async {
    final url = ApiConfig.getUrl(ApiConfig.urlHoraries) + id.toString();
    try {
      final response = await get(
        url,
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
        const Duration(seconds: 10),
      );
      print(response.body);

      if (response.statusCode == 200) {
        return HoraryModel.fromMap(response.body);
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }

  // Método para adicionar um novo horário à API
  Future<int> add(HoraryModel horary) async {
    final url = ApiConfig.getUrl(ApiConfig.urlHoraries);
    try {
      final response = await post(
        url,
        horary.toMap(),
        headers: HttpHeadersConfig.buildHeadersWithUserLogged(),
      ).timeout(
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

  // Método para editar um horário existente na API
  Future<void> edit(HoraryModel horary) async {
    final url = ApiConfig.getUrl(ApiConfig.urlHoraries) + horary.id.toString();
    try {
      final response = await put(
        url,
        horary.toMap(),
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

  // Método para deletar um horário por ID da API
  Future<void> del(int id) async {
    final url = ApiConfig.getUrl(ApiConfig.urlHoraries) + id.toString();
    try {
      final response = await delete(
        url,
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

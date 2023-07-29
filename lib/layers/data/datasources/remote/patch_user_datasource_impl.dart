import 'dart:async';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/dto/user_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/layers/data/datasources/patch_user_datasource.dart';

import 'package:easyflow/layers/domain/exceptions/api_exception.dart';

class PatchUserDataSourceImpl implements PatchUserDataSource {
  @override
  Future<UserDto> call(UserDto userDto) async {
    final url = ApiConfig.getUrl(ApiConfig.user);

    try {
      final response = await http
          .put(
            Uri.parse(
              url,
            ),
            body: jsonEncode(userDto.toMap()),
            headers: HttpHeadersConfig.buildHeadersWithoutAuth(),
          )
          .timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        return UserDto.fromMap(
          jsonDecode(
            response.body,
          ),
        );
      } else {
        throw ApiException('Erro ao Realizar Operação', 'Tente novamente');
      }
    } on TimeoutException catch (_) {
      throw ApiException('Erro ao Realizar Operação ',
          'Servidor indisponível, Tente novamente');
    }
  }
}

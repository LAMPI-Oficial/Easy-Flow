import 'package:easyflow/core/config/api_config.dart';
import 'package:easyflow/core/config/http_headers_config.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:get/get.dart';

class ComplaintProvider extends GetConnect {
  Future<void> addComplaint(
      {required String name,
      required String email,
      required String description}) async {
    final url = ApiConfig.getUrl(ApiConfig.urlComplaints);
    final body = {
      "claim_descrition": description,
      "claim_email_user": email,
      "claim_name_user": name,
    };

    try {
      final response = await post(url, body,
              headers: HttpHeadersConfig.buildHeadersWithUserLogged())
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw ApiException('Erro ao realizar enviar reclamação',
              'Servidor temporariamente indisponível!');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Reclamação adicionado com sucesso! ${response.body.toString()}");
      } else if (response.statusCode == 403) {
        throw ApiException(
            "Acesso negado", "Você não tem permissão para realizar essa ação!");
      } else {
        throw ApiException(
            "Erro interno", "Não foi possível atender a sua solicitação!");
      }
    } catch (error) {
      throw ApiException("Erro desconhecido", error.toString());
    }
  }
}

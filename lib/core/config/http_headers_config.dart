import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:get/get.dart';

class HttpHeadersConfig {
  static Map<String, String> buildHeadersWithToken(String token) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': "Bearer $token"
    };
    return headers;
  }

  static Map<String, String> buildHeadersWithUserLogged() {
    final userService = Get.put(UserService());

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization':
          userService.logged ? "Bearer ${userService.userLogged.token}" : "",
    };

    return headers;
  }

  static Map<String, String> buildHeadersWithoutAuth() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    return headers;
  }
}

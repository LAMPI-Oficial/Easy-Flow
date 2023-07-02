import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:get_it/get_it.dart';

class HttpHeadersConfig {
  static Map<String, String> buildHeadersWithToken(String token) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': "Bearer $token"
    };

    return headers;
  }

  static Map<String, String> buildHeadersWithUserLogged() {
    final _userProvider = GetIt.I.get<UserService>();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': _userProvider.logged
          ? "Bearer ${_userProvider.userLogged.token}"
          : "",
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

class ApiConfig {
  // static const String _urlApi = "http://10.12.14.187:8080";
<<<<<<< HEAD
  static const String _urlApi = "http://165.232.71.169:8080";
=======

  static const String _urlApi = "https://02ca-200-17-32-75.ngrok-free.app";
>>>>>>> f6905a5876054807a9810f26f8b39c91abe8ce33

  static const String urlEndPointAuth = "/auth";

  static const String urlEndPointCreateUser = "/users";

  static const String _urlEndPointGetUserByLogin =
      "/users/search_by_login?login=#login#";

  static const String urlHorariesByRequester = "/horaries/requester/";
  static const String urlHoraries = "/horaries/";

  static String getUrl(endpoint) => _urlApi + endpoint;

  static String urlEndPointGetUserByLogin({required String login}) =>
      _urlEndPointGetUserByLogin.replaceAll("#login#", login);
}

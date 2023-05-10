class ApiConfig {
  // static const String _urlApi = "http://10.12.14.187:8080";
  static const String _urlApi = "https://2fdd-200-17-32-74.ngrok-free.app";

  static const String urlEndPointAuth = "/auth";

  static const String urlEndPointCreateUser = "/persons";
  static const String urlEndPointCreateAdress = "/address";

  static const String _urlEndPointGetUserByLogin =
      "/users/search_by_login?login=#login#";

  static const String urlHorariesByRequester = "/horaries/requester/";
  static const String urlHoraries = "/horaries/";

  static const String urlCourses = "/courses";
  static const String urlStudyArea = "/study_area";

  static String getUrl(endpoint) => _urlApi + endpoint;

  static String urlEndPointGetUserByLogin({required String login}) =>
      _urlEndPointGetUserByLogin.replaceAll("#login#", login);
}

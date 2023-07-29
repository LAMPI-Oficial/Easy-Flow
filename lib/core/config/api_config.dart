class ApiConfig {
  // static const String _urlApi = "http://10.12.14.187:8080";

  static const String _urlApi = "http://localhost:3000";

  static const String urlEndPointAuth = "/auth";

  static const String urlEndPointCreateUser = "/users";

  static const String _urlEndPointGetUserByLogin =
      "/users/search_by_login?login=#login#";

  static const String urlCourses = "/courses";
  static const String urlStudyAreas = "/study_area";
  static const String user = "/users";
  static const String urlSchedules = "/schedules/";

  static const String urlDailys = "/dailys";
  static const String urlComplaints = "/complaints";
  static const String urlRepresentatives = "/representatives";
  static const String urlAnnouncements = "/announcements";
  static const String urlEquipments = "/equipments";

  static String getUrl(endpoint) => _urlApi + endpoint;

  static String urlEndPointGetUserByLogin({required String login}) =>
      _urlEndPointGetUserByLogin.replaceAll("#login#", login);

  static const String urlStorage =
      "https://firebasestorage.googleapis.com/v0/b/easyflow-55ea5.appspot.com/o";
}

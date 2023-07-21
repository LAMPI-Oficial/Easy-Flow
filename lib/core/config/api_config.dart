class ApiConfig {
  // static const String _urlApi = "http://10.12.14.187:8080";

  static const String _urlApi =
      "https://easyflow-55ea5-default-rtdb.firebaseio.com";

  static const String urlEndPointAuth = "/auth";

  static const String urlEndPointCreateUser = "/users";

  static const String _urlEndPointGetUserByLogin =
      "/users/search_by_login?login=#login#";

  static const String urlCourses = "/courses.json";
  static const String urlStudyAreas = "/study_area.json";
  static const String user = "/users/0.json";
  static const String urlSchedules = "/schedules/";

  static const String urlDailys = "/dailys.json";
  static const String urlComplaints = "/complaints.json";
  static const String urlRepresentatives = "/representatives.json";
  static const String urlAnnouncements = "/announcements.json";
  static const String urlEquipments = "/equipments.json";

  static String getUrl(endpoint) => _urlApi + endpoint;

  static String urlEndPointGetUserByLogin({required String login}) =>
      _urlEndPointGetUserByLogin.replaceAll("#login#", login);

  static const String urlStorage =
      "https://firebasestorage.googleapis.com/v0/b/easyflow-55ea5.appspot.com/o";
}

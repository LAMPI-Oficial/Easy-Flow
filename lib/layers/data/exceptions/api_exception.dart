class ApiException implements Exception {
  final String title;
  final String message;

  ApiException(this.title, this.message);
}


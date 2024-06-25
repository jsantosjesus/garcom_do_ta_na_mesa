abstract class ErrorException implements Exception {
  final String? message;

  ErrorException({this.message});
}

class DatasourceError implements ErrorException {
  @override
  final String message;

  DatasourceError({required this.message});
}

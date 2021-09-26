class RestClientException implements Exception {
  RestClientException({
    this.message,
    this.statusCode,
    this.error,
  });

  final String? message;
  final int? statusCode;
  final dynamic error;
}

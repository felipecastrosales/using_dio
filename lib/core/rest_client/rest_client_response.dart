
class RestClientResponse<T> {

  RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  T? data;
  int? statusCode;
  String? statusMessage;
}

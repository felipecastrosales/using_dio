import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = env['apiKey'] ?? '';

    if (options.extra.containsKey('auth_required')) {
      options.queryParameters.addAll({
        'api_key': apiKey,
        'language': 'pt-BR',
      });
    }

    handler.next(options);
  }
}

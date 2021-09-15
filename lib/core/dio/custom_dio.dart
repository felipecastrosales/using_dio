import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'interceptors/time_execution_interceptor.dart';

class CustomDio extends DioForNative {
  static final _baseOptions = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: 60000,
    receiveTimeout: 60000,
  );

  CustomDio() : super(_baseOptions) {
    interceptors.addAll(
      [
        TimeExecutionInterceptor(),
      ],
    );
  }
}

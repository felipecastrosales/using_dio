import 'package:dio/dio.dart';

import 'package:using_dio/core/dio/interceptors/auth_interceptor.dart';
import 'package:using_dio/core/dio/interceptors/time_execution_interceptor.dart';
import 'package:using_dio/core/rest_client/rest_client_exception.dart';
import 'package:using_dio/core/rest_client/rest_client_response.dart';

import 'rest_client.dart';

class RestClientDio implements RestClient {
  late Dio _dio;

  final _baseOptions = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: 60000,
    receiveTimeout: 60000,
  );

  RestClientDio() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.addAll(
      [
        TimeExecutionInterceptor(),
        AuthInterceptor(),
      ],
    );
  }

  @override
  RestClient auth() {
    _baseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
      );
      return RestClientResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return RestClientResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String path, {
    required String method,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );
      return _dioConverter<T>(response);
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  RestClientResponse<T> _dioConverter<T>(Response<T> response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }
}

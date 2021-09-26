import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:using_dio/core/exceptions/repository_exception.dart';
import 'package:using_dio/core/dio/custom_dio.dart';
import 'package:using_dio/core/rest_client/rest_client.dart';
import 'package:using_dio/models/movies.dart';
import 'movies_repository.dart';

class MoviesRepositoryRestClient implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryRestClient({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Movies> findPopularMovies() async {
    try {
      final result = await _restClient.auth().get('/movie/popular');
      print('Timer: ${result.data['execution_time']}');
      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }

  @override
  Future<Movies> findTopRatedMovies() async {
    try {
      final result = await _restClient.auth().get('/movie/top_rated');
      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }
}

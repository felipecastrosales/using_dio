import 'package:dio/dio.dart';

import 'package:using_dio/core/dio/custom_dio.dart';
import 'package:using_dio/core/exceptions/repository_exception.dart';
import 'package:using_dio/models/movies.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<Movies> findPopularMovies() async {
    try {
      final dio = CustomDio();
      final result = await dio.auth().get('/movie/popular');
      print('CustomDio Result: ${result.data}');
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
      final dio = CustomDio();
      final result = await dio.auth().get('/movie/top_rated');
      print('CustomDio Result: ${result.data}');
      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }
}

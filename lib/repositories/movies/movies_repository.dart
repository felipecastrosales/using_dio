import 'package:using_dio/models/movies.dart';

abstract class MoviesRepository {
  Future<Movies> findPopularMovies();
  Future<Movies> findTopRatedMovies();
}

import 'package:get/get.dart';

import 'package:using_dio/models/movie.dart';
import 'package:using_dio/repositories/movies/movies_repository.dart';

class MoviesController extends GetxController {
  String type = Get.arguments;
  final _totalPages = 0.obs;
  final _movies = <Movie>[].obs;

  int get totalPages => _totalPages.value;
  List<Movie> get movies => _movies;

  @override
  Future<void> onInit() async {
    await findMovies();
    super.onInit();
  }

  Future<void> findMovies() async {
    MoviesRepository repository = Get.find();
    if (type == 'populares') {
      final movies = await repository.findPopularMovies();
      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
    } else {
      final movies = await repository.findTopRatedMovies();
      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
    }
  }
}

import 'package:get/get.dart';

import 'package:using_dio/models/movie.dart';
import 'package:using_dio/models/movies.dart';
import 'package:using_dio/repositories/movies/movies_repository.dart';

class MoviesController extends GetxController {
  String type = Get.arguments;
  final _totalPages = 0.obs;
  final _movies = <Movie>[].obs;
  final _loading = false.obs;
  final _error = ''.obs;

  int get totalPages => _totalPages.value;
  List<Movie> get movies => _movies;
  bool get loading => _loading.value;
  bool get hasError => _error.isNotEmpty;
  String get error => _error.value;

  @override
  Future<void> onInit() async {
    await findMovies();
    super.onInit();
  }

  Future<void> findMovies() async {
    try {
      _loading.toggle();
      _error('');
      MoviesRepository repository = Get.find();
      Movies movies;

      if (type == 'populares') {
        movies = await repository.findPopularMovies();
      } else {
        movies = await repository.findTopRatedMovies();
      }

      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
      _loading.toggle();
    } catch (e) {
      _loading.toggle();
      _error('Erro ao buscar dados');
    }
  }
}

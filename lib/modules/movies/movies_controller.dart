import 'package:get/get.dart';

import 'package:using_dio/models/movie.dart';
import 'package:using_dio/repositories/movies/movies_repository.dart';

class MoviesController extends GetxController {
  String type = Get.arguments;
  final _totalPages = 0.obs;
  final _movies = <Movie>[].obs;
  final _loading = false.obs;

  int get totalPages => _totalPages.value;
  List<Movie> get movies => _movies;
  bool get loading => _loading.value;

  @override
  Future<void> onInit() async {
    await findMovies();
    super.onInit();
  }

  Future<void> findMovies() async {
    _loading.toggle();
    await 3.seconds.delay();
    MoviesRepository repository = Get.find();
    if (type == 'populares') {
      final movies = await repository.findPopularMovies();
      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
      _loading.toggle();
    } else {
      final movies = await repository.findTopRatedMovies();
      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
      _loading.toggle();
    }
  }
}

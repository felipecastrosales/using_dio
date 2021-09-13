import 'package:get/get.dart';

import 'package:using_dio/repositories/movies/movies_repository.dart';
import 'package:using_dio/repositories/movies/movies_repository_impl.dart';
import 'movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(),
    );
    Get.put(
      MoviesController(),
    );
  }
}

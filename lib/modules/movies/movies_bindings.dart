import 'package:get/get.dart';

import 'package:using_dio/core/rest_client/rest_client.dart';
import 'package:using_dio/core/rest_client/rest_client_dio.dart';
import 'package:using_dio/modules/movies/movies_controller.dart';
import 'package:using_dio/repositories/movies/movies_repository.dart';
import 'package:using_dio/repositories/movies/movies_repository_rest_client.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.create<RestClient>(
      () => RestClientDio(),
    );
    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryRestClient(
        restClient: Get.find(),
      ),
    );
    Get.put(MoviesController());
  }
}

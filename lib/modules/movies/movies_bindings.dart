import 'package:get/get.dart';

import 'movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      MoviesController(),
    );
  }
}

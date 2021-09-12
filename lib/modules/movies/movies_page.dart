import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'movies_controller.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesPage'),
      ),
      body: Container(),
    );
  }
}

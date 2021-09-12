import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'modules/home/home_bindings.dart';
import 'modules/home/home_page.dart';
import 'modules/movies/movies_bindings.dart';
import 'modules/movies/movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Using Dio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/movies',
          page: () => const MoviesPage(),
          binding: MoviesBindings(),
        ),
      ],
    );
  }
}

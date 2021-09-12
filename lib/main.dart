import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'modules/home/home_bindings.dart';
import 'modules/home/home_page.dart';

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
      home: Container(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
      ],
    );
  }
}

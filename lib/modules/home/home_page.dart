import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton.icon(
              onPressed: () => Get.toNamed(
                '/movies',
                arguments: 'popular',
              ),
              icon: const Icon(Icons.people_alt_outlined),
              label: const Text('Top Rated'),
            ),
            ElevatedButton.icon(
              onPressed: () => Get.toNamed(
                '/movies',
                arguments: 'topRated',
              ),
              icon: const Icon(Icons.people_alt_outlined),
              label: const Text('Top Rated'),
            ),
          ],
        ),
      ),
    );
  }
}

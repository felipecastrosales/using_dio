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
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Films Total: 0'),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.network(
                            'https://br.web.img3.acsta.net/pictures/15/09/29/12/57/543717.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: Text(
                            'CR7 Film',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: Text(
                            'Film Description',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

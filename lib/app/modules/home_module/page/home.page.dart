import 'package:flutter/material.dart';
import 'package:flutter_chrome_extension/app/routes/app.routes.dart';
import 'package:get/get.dart';

import '../home_page.controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculadora Mercado Livre'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você apertou o botão tantas vezes:',
            ),
            Obx(
              () => Text(
                controller.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              child: ElevatedButton.icon(
                onPressed: () => Get.toNamed(AppRoutes.INFO),
                icon: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                ),
                label: const Text('Próxima página'),
              ),
            ),
            const Divider(color: Colors.white),
            TextButton.icon(
              onPressed: () async => await controller.navigateML(),
              icon: const Icon(Icons.link),
              label: const Text('Mercado Livre'),
            ),
            const Divider(height: 12.0, color: Colors.white),
            TextButton.icon(
              onPressed: () async => await controller.navigateLinkedin(),
              icon: const Icon(Icons.link),
              label: const Text('Linkedin'),
            ),
            const Divider(height: 12.0, color: Colors.white),
            TextButton.icon(
              onPressed: () async => await controller.navigateGitHub(),
              icon: const Icon(Icons.link),
              label: const Text('GitHub'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

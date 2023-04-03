import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../info_page.controller.dart';

class InfoPage extends GetView<InfoPageController> {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const SelectableText('Informações'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 140,
                height: 140,
                child: CircleAvatar(
                  backgroundColor: Get.theme.colorScheme.primary,
                  child: const SizedBox(
                    width: 130,
                    height: 130,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FlutterLogo(size: 110),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 12.0, color: Colors.white),
            const Text(
              'Esta extensão foi criada por Gesaias Alves para estudos de criação de extensões com Flutter, pode ser feita o uso com qualquer produto do mercado livre para ver a Receita do produto, Taxas, etc.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

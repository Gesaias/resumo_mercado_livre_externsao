import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app.pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Extension Chrome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: pages,
    );
  }
}

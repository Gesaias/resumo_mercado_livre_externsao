import 'package:get/get.dart';

import 'home_page.controller.dart';

class HomePageBinding implements Bindings {
@override
void dependencies() {
  Get.put<HomePageController>(HomePageController());
  }
}

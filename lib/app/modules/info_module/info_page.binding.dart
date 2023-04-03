import 'package:get/get.dart';

import 'info_page.controller.dart';

class InfoPageBinding implements Bindings {
@override
void dependencies() {
  Get.put<InfoPageController>(InfoPageController());
  }
}

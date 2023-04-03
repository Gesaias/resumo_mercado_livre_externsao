import 'package:get/get.dart';

import '../modules/home_module/home_page.binding.dart';
import '../modules/home_module/page/home.page.dart';
import '../modules/info_module/info_page.binding.dart';
import '../modules/info_module/page/info.page.dart';
import 'app.routes.dart';

final List<GetPage> pages = [
  GetPage(
    name: AppRoutes.INITIAL,
    page: () => const HomePage(),
    binding: HomePageBinding(),
  ),
  GetPage(
    name: AppRoutes.INFO,
    page: () => const InfoPage(),
    binding: InfoPageBinding(),
  ),
];

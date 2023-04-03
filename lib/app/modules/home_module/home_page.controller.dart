import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageController extends GetxController {
  HomePageController();

  final RxInt _counter = 0.obs;

  int get counter => _counter.value;

  final Uri _url = Uri.parse('https://www.mercadolivre.com.br/');
  final Uri _linkedinUrl = Uri.parse('https://www.linkedin.com/in/gesaias-alves/');
  final Uri _gitHubUrl = Uri.parse('https://github.com/Gesaias/');

  void incrementCounter() => _counter.value++;

  Future<void> navigateML() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> navigateLinkedin() async {
    if (!await launchUrl(_linkedinUrl)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> navigateGitHub() async {
    if (!await launchUrl(_gitHubUrl)) {
      throw Exception('Could not launch $_url');
    }
  }
}

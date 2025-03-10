import 'package:get/get.dart';
import 'package:projects/ui/screens/home_screens/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
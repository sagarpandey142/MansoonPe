import 'package:get/get.dart';
import 'open_project_controller.dart';

class OpenProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenProjectController());
  }
}
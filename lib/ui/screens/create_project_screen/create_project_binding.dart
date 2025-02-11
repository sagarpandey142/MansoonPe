import 'package:get/get.dart';
import 'create_project_controller.dart';

class CreateProjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectController>(() => CreateProjectController());
  }
}

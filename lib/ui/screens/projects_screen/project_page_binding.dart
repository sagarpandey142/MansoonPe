
import 'package:get/get.dart';
import 'package:projects/ui/screens/projects_screen/project_page_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectPageController>(() => ProjectPageController());
  }
}

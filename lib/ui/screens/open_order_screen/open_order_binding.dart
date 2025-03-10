import 'package:get/get.dart';
import 'open_order_controller.dart';

class OpenOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpenOrderController>(() => OpenOrderController());
  }
}
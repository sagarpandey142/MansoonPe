import 'package:get/get.dart';
import 'package:projects/ui/screens/order_screen/order_page_controller.dart';

class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPageController>(() => OrderPageController());
  }
}
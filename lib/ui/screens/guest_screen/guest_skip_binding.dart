import 'package:get/get.dart';
import 'guest_skip_controller.dart';

class GuestSkipBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestSkipController>(() => GuestSkipController());
  }
}

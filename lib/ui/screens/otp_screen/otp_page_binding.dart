import 'package:get/get.dart';
import 'otp_page_controller.dart';

class OtpPageBinding extends Bindings {
  final String phoneNumber;

  OtpPageBinding(this.phoneNumber);

  @override
  void dependencies() {
    Get.lazyPut<OtpPageController>(
            () => OtpPageController(phoneNumber: phoneNumber));
  }
}
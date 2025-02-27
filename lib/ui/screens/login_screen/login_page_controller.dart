import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/api_services/api_service.dart';
import 'package:projects/modals/otp_req.dart';
import '../otp_screen/otp_page_screen.dart'; // Import OTP screen

class LoginPageController extends GetxController {
  TextEditingController phoneController =
      TextEditingController(); // Text Field Controller

  // Inside LoginPageController
  final RxBool isTyping = false.obs;
  var isError = false.obs;
  Future<void> generateOTP() async {
    String phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      Get.snackbar("Error", "Phone number cannot be empty",
          backgroundColor: Colors.red, colorText: Colors.white);

      isError.value = true;
      return;
    }

    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      Get.snackbar("Error", "Please enter a valid 10-digit phone number",
          backgroundColor: Colors.red, colorText: Colors.white);
      isError.value = true;
      return;
    }
    isError.value = false;

    try {
      OtpReq req = OtpReq();
      req.phoneNumber = phoneNumber;

      Repository repo = Repository();

      var res = await repo.generateOTP(req);

      print("VskingGenOTP:>>>$res");
      if (res.status == 200) {
        Get.to(() => OtpPageScreen(phoneNumber: phoneNumber));
      } else {
        Get.snackbar("Error", "Failed to generate OTP!",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      isError.value = true;
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}

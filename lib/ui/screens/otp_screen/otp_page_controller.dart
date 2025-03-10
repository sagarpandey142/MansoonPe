import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projects/api_services/api_service.dart';
import 'package:projects/modals/verify_otp_req.dart';
import 'package:projects/ui/screens/home_screens/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../register_screen/register_page_screen.dart';

class OtpPageController extends GetxController {
  final String phoneNumber;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  OtpPageController({required this.phoneNumber});

  Future<void> verifyOtp(String otp) async {
    try {
      VerifyOtpReq req = VerifyOtpReq();
      req.phoneNumber = phoneNumber;
      req.otp = otp;
      Repository repo = Repository();
      var res = await repo.verifyOTP(req);

      if(res.status == 200){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", res.data!.token!);
        await prefs.setString("id", "${res.data!.user!.id}");
        await prefs.setString("phone", "${res.data!.user!.phoneNumber}");
        Get.snackbar(
          "Success",
          "OTP verified successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF4CAF50),
          colorText: const Color(0xFFFFFFFF),
          margin: const EdgeInsets.only(bottom: 10), // Snackbar ko upar shift karega
        );
        if(res.data!.user!.userProfile != null){
          //   registered
          Get.offAll(() => HomePageScreen());
        }else{
          //   not registered
          Get.offAll(() => RegisterPageScreen());
        }
      }else{
        Get.snackbar("Error", "Something went wrong");
      }
    } catch (e) {
      print("Something went wrong: $e");
      Get.snackbar("Error!", "Something went wrong!");
    }
  }

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");
    token ??= await storage.read(key: "auth_token");
    return token;
  }

  Future<bool> isUserAuthenticated() async {
    String? token = await getAuthToken();
    return token != null;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    await storage.delete(key: "auth_token");

    Get.offAll(() => RegisterPageScreen());
  }
}
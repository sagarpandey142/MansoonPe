import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projects/api_services/api_service.dart';
import 'package:projects/modals/otp_req.dart';
import 'dart:convert';
import '../otp_screen/otp_page_screen.dart'; // Import OTP screen

class LoginPageController extends GetxController {
  TextEditingController phoneController =
      TextEditingController(); // Text Field Controller

  bool isError=false;
  Future<void> generateOTP() async {
    String phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      Get.snackbar("Error", "Phone number cannot be empty",
          backgroundColor: Colors.red, colorText: Colors.white);

      isError=true;
      return;
    }

    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      Get.snackbar("Error", "Please enter a valid 10-digit phone number",
          backgroundColor: Colors.red, colorText: Colors.white);
      isError=true;
      return;
    }
    isError=false;

    try{
      OtpReq req=OtpReq();
      req.phoneNumber = phoneNumber;

      Repository repo=Repository();

      var res= await repo.generateOTP(req);

      print("VskingGenOTP:>>>$res");
      if(res == "true"){
        Get.to(() => OtpPageScreen(phoneNumber: phoneNumber));
      }else{
        Get.snackbar("Error", "Failed to generate OTP!",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }catch(e){
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          backgroundColor: Colors.red, colorText: Colors.white);
    }


    //
    // final String apiUrl =
    //     "http://ec2-13-127-91-221.ap-south-1.compute.amazonaws.com:8080/api/auth/send-otp";
    //
    // Map<String, dynamic> requestBody = {
    //   "phoneNumber": phoneNumber,
    // };
    //
    // try {
    //   final response = await http.post(
    //     Uri.parse(apiUrl),
    //     headers: {"Content-Type": "application/json"},
    //     body: jsonEncode(requestBody),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     print("OTP Sent Successfully: ${response.body}");
    //     Get.to(() => OtpPageScreen(phoneNumber: phoneNumber));
    //   } else {
    //     print("Failed to send OTP: ${response.body}");
    //     Get.snackbar("Error", "Failed to send OTP. Try again!",
    //         backgroundColor: Colors.red, colorText: Colors.white);
    //   }
    // } catch (e) {
    //   print("Error: $e");
    //   Get.snackbar("Error", "Something went wrong!",
    //       backgroundColor: Colors.red, colorText: Colors.white);
    // }
  }
}

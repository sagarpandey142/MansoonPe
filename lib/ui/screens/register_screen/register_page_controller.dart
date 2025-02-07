import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  var isChecked = false.obs;

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  void continueRegistration() {
    if (isChecked.value) {
      print("Business Name: ${businessNameController.text}");
      print("GST Number: ${gstNumberController.text}");
      print("PAN Number: ${panNumberController.text}");
      // Proceed to next screen or API call
    } else {
      print("Please accept Terms & Conditions.");
    }
  }
}

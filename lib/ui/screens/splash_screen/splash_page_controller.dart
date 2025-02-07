import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_screen/login_page_screen.dart';

class SplashPageController extends GetxController {
  // Timer to navigate after 3 seconds
  void navigateToNextScreen(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      // Navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPageScreen()),
      );
    });
  }
}

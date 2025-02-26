import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/home_screens/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_screen/login_page_screen.dart';

class SplashPageController extends GetxController {
  // Timer to navigate after 3 seconds
  void navigateToNextScreen(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      debugPrint("AuthToken:>>$token");
      if(!context.mounted) return;
      if(token.isNotEmpty){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePageScreen()),
        );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPageScreen()),
        );
      }

    });
  }
}

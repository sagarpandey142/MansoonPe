import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/splash_screen/splash_page_binding.dart';
import 'package:projects/ui/screens/splash_screen/splash_page_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashPageBinding(),  // Register the controller binding
      home: SplashPageScreen(),  // Navigate to splash screen
    );
  }
}

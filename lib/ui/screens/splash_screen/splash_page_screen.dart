import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/custom_colour.dart';
import 'splash_page_controller.dart';

class SplashPageScreen extends StatelessWidget {
  const SplashPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Register SplashPageController before using it
    Get.put(SplashPageController());  // Registers the controller

    // Instantiate the controller after registration
    final SplashPageController controller = Get.find<SplashPageController>();

    // Call the method to navigate after 3 seconds
    controller.navigateToNextScreen(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background with no line separating
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.primaryColor,
                  CustomColor.secondaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Centered image with increased size
          Center(
            child: Image.asset(
              'assets/images/splash screen logo.png', // Replace with your image path
              width: 350, // Increased size
              height: 350, // Increased size
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
          // Background with SVG image
          SvgPicture.asset(
            'assets/images/background_screen.svg', // Replace with your SVG image path
            fit: BoxFit.cover, // Ensures the SVG covers the screen
            width: double.infinity, // Makes sure the SVG fills the width
            height: double.infinity, // Makes sure the SVG fills the height
          ),

          // Centered logo (using Center widget)
          Center(
            child: Image.asset(
              'assets/images/splash screen logo.png', // Replace with your logo path
              width: 350, // Adjust the size
              height: 350, // Adjust the size
            ),
          ),
        ],
      ),
    );
  }
}

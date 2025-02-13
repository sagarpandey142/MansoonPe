import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'splash_page_controller.dart';

class SplashPageScreen extends StatelessWidget {
  const SplashPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Register and find the controller
    Get.put(SplashPageController());
    final SplashPageController controller = Get.find<SplashPageController>();

    // Start the navigation after animation
    controller.navigateToNextScreen(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background SVG
          SvgPicture.asset(
            'assets/images/background_screen.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Fast Animated Truck Logo
          Center(
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 800), // Fast animation
              curve: Curves.fastOutSlowIn, // Fast start, smooth stop
              tween: Tween<double>(begin: 0.2, end: 1.2), // Start small, grow big
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  alignment: Alignment.center, // Keep centered
                  child: child,
                );
              },
              child: SvgPicture.asset(
                'assets/images/truck_splash_screen_logo1.svg',
                width: 300,
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

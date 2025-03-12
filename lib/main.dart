import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_screen.dart';
import 'package:projects/ui/screens/open_order_screen/open_order_screen.dart';

import 'package:projects/ui/screens/splash_screen/splash_page_binding.dart';
import 'package:projects/ui/screens/splash_screen/splash_page_screen.dart';
import 'package:projects/ui/screens/home_screens/home_page_screen.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';
import 'package:projects/ui/screens/order_screen/order_page_screen.dart';
import 'package:projects/ui/screens/profile_screen/profile_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      initialRoute: '/splash', // Set Splash Screen as the first route
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashPageScreen(),
          binding: SplashPageBinding(),
        ),
        GetPage(name: '/home', page: () => HomePageScreen()),
        GetPage(name: '/Createproject', page: () => CreateProjectScreen()),
        GetPage(name: '/orders', page: () => OrderPageScreen()),
        GetPage(name: '/openOrder', page: () => OpenOrderScreen()),
        GetPage(name: '/profile', page: () => ProfilePageScreen()),
        GetPage(name: '/project', page: () => ProjectPageScreen()),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/order_screen/order_page_screen.dart';
import 'package:projects/ui/screens/profile_screen/profile_page_screen.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';

import '../ui/screens/home_screens/home_page_screen.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Get.offAll(() => HomePageScreen());
        break;
      case 1:
        Get.offAll(() => ProjectPageScreen());
        break;
      case 2:
        Get.offAll(() => OrderPageScreen());
        break;
      case 3:
        Get.offAll(() => ProfilePageScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Prevents items from shifting
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF603EA4),
      unselectedItemColor: Color(0x99000000),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        // print("vskingII:>>>$index");
        // onTap(index);
        // _navigateToScreen(index);
      },
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 0
                ? "assets/custom_bottom_navigation/home_color.svg"
                : "assets/custom_bottom_navigation/home.svg",
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 1
                ? "assets/custom_bottom_navigation/project_color.svg"
                : "assets/custom_bottom_navigation/project.svg",
          ),
          label: "Projects",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 2
                ? "assets/custom_bottom_navigation/order_color.svg"
                : "assets/custom_bottom_navigation/order.svg",
          ),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            currentIndex == 3
                ? "assets/custom_bottom_navigation/profile_color.svg"
                : "assets/custom_bottom_navigation/profile.svg",
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
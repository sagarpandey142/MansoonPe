import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/after_register_home_screen/home_page_screen.dart';
import 'package:projects/ui/screens/order_screen/order_page_screen.dart';
import 'package:projects/ui/screens/profile_screen/profile_page_screen.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

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
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF603EA4),
      unselectedItemColor: Color(0x99000000),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        onTap(index);
        _navigateToScreen(index);
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
          icon: currentIndex == 0
              ? SvgPicture.asset("assets/custom_bottom_navigation/home_color.svg")
              : SvgPicture.asset("assets/custom_bottom_navigation/home.svg"),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? SvgPicture.asset("assets/custom_bottom_navigation/project_color.svg")
              : SvgPicture.asset("assets/custom_bottom_navigation/project.svg"),
          label: "Projects",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? SvgPicture.asset("assets/custom_bottom_navigation/order_color.svg")
              : SvgPicture.asset("assets/custom_bottom_navigation/order.svg"),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 3
              ? SvgPicture.asset("assets/custom_bottom_navigation/profile_color.svg")
              : SvgPicture.asset("assets/custom_bottom_navigation/profile.svg"),
          label: "Profile",
        ),
      ],
    );
  }
}
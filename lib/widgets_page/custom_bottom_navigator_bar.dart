import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF603EA4),
      unselectedItemColor: Colors.black54,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        if (index == currentIndex) return; // Prevent unnecessary rebuilds

        switch (index) {
          case 0:
            Get.offNamed('/home');
            break;
          case 1:
            Get.offNamed('/projects');
            break;
          case 2:
            Get.offNamed('/orders');
            break;
          case 3:
            Get.offNamed('/profile');
            break;
        }
        onTap(index);
      },
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF603EA4),
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
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

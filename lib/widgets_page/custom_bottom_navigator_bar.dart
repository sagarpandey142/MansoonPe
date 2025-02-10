import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF603EA4),
      unselectedItemColor: Color(0x99000000),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTap,
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

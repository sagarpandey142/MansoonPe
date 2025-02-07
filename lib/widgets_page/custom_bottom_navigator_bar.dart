import 'package:flutter/material.dart';

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
      currentIndex: currentIndex, // Set the current selected index
      selectedItemColor: Color(0xFF62449D), // Purple color for selected item
      unselectedItemColor: Colors.grey, // Grey color for unselected items
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? Image.asset("assets/bottom_navigator_images/home_color.png")
              : Image.asset("assets/bottom_navigator_images/home_image.png"),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? Image.asset("assets/bottom_navigator_images/projcet.png")
              : Image.asset("assets/bottom_navigator_images/projects_image.png"),
          label: "Projects",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? Image.asset("assets/bottom_navigator_images/order_color.png")
              : Image.asset("assets/bottom_navigator_images/orders_images.png"),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 3
              ? Image.asset("assets/bottom_navigator_images/profile_color.png")
              : Image.asset("assets/bottom_navigator_images/profile_image.png"),
          label: "Profile",
        ),
      ],
    );
  }
}

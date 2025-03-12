// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';
// import 'package:projects/modals/all_order_res.dart' as allorder;
// import 'package:projects/ui/screens/order_screen/order_page_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../api_services/repo.dart';
// import '../modals/project_res.dart';
//
// class CustomBottomNavigationBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavigationBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   @override
//   State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
// }
//
// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//
//   List<Projects> projects = [];
//   List<allorder.Orders> orders = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getProjects();
//     getAllOrders();
//   }
//   getAllOrders() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String token = prefs.getString("auth_token") ?? '';
//       // var uid = prefs.getString("id") ?? '';
//       // var mob= prefs.getString("phone") ?? '';
//       Repository repo = Repository(token: token);
//       var res = await repo.getAllOrders({});
//       debugPrint("VskingProfileRes:>>>$res");
//       if (res.status == 200) {
//         setState(() {
//           orders = res.data!.orders!;
//         });
//       }
//     } catch (e) {
//       debugPrint("Error: $e");
//       // Get.snackbar("Error", "Something went wrong!",
//       //     snackPosition: SnackPosition.TOP,
//       //     backgroundColor: Colors.red,
//       //     colorText: Colors.white);
//     }
//   }
//
//   getProjects() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String token = prefs.getString("auth_token") ?? '';
//       // var uid = prefs.getString("id") ?? '';
//       // var mob= prefs.getString("phone") ?? '';
//       Repository repo = Repository(token: token);
//       var res = await repo.getProjects({});
//       debugPrint("VskingProfileRes:>>>$res");
//       if (res.status == 200) {
//         setState(() {
//           projects = res.data!.projects!;
//         });
//       }
//     } catch (e) {
//       debugPrint("Error: $e");
//       // Get.snackbar("Error", "Something went wrong!",
//       //     snackPosition: SnackPosition.TOP,
//       //     backgroundColor: Colors.red,
//       //     colorText: Colors.white);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       type: BottomNavigationBarType.fixed,
//       currentIndex: widget.currentIndex,
//       selectedItemColor: Color(0xFF603EA4),
//       unselectedItemColor: Colors.black54,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       onTap: (index) {
//         if (index == widget.currentIndex) return; // Prevent unnecessary rebuilds
//
//         switch (index) {
//           case 0:
//             Get.offNamed('/home');
//             break;
//           case 1:
//             projects.isNotEmpty ? Get.offNamed('/project') : Get.offNamed('/Createproject');
//             break;
//           case 2:
//             orders.isNotEmpty ? Get.offNamed('/openOrder') : Get.offNamed('/orders');
//             break;
//           case 3:
//             Get.offNamed('/profile');
//             break;
//         }
//         widget.onTap(index);
//       },
//       selectedLabelStyle: GoogleFonts.poppins(
//         fontSize: 12,
//         fontWeight: FontWeight.w500,
//         color: Color(0xFF603EA4),
//       ),
//       unselectedLabelStyle: GoogleFonts.poppins(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: Colors.black54,
//       ),
//       items: [
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             widget.currentIndex == 0
//                 ? "assets/custom_bottom_navigation/home_color.svg"
//                 : "assets/custom_bottom_navigation/home.svg",
//           ),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             widget.currentIndex == 1
//                 ? "assets/custom_bottom_navigation/project_color.svg"
//                 : "assets/custom_bottom_navigation/project.svg",
//           ),
//           label: "Projects",
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             widget.currentIndex == 2
//                 ? "assets/custom_bottom_navigation/order_color.svg"
//                 : "assets/custom_bottom_navigation/order.svg",
//           ),
//           label: "Orders",
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             widget.currentIndex == 3
//                 ? "assets/custom_bottom_navigation/profile_color.svg"
//                 : "assets/custom_bottom_navigation/profile.svg",
//           ),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_services/repo.dart';
import '../modals/project_res.dart';
import 'package:projects/modals/all_order_res.dart' as allorder;
import '../ui/screens/create_project_screen/create_project_screen.dart';
import '../ui/screens/home_screens/home_page_screen.dart';
import '../ui/screens/open_order_screen/open_order_screen.dart';
import '../ui/screens/order_screen/order_page_screen.dart';
import '../ui/screens/profile_screen/profile_page_screen.dart';
import '../ui/screens/projects_screen/project_page_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  List<Projects> projects = [];
  List<allorder.Orders> orders = [];
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    getProjects();
    getAllOrders();
  }

  void updatePages() {
    setState(() {
      pages = [
        HomePageScreen(),
        projects.isNotEmpty ? ProjectPageScreen() : CreateProjectScreen(),
        orders.isNotEmpty ? OpenOrderScreen() : OrderPageScreen(),
        ProfilePageScreen(),
      ];
    });
  }

  getAllOrders() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getAllOrders({});
      if (res.status == 200) {
        setState(() {
          orders = res.data!.orders!;
          updatePages(); // Update pages after fetching orders
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  getProjects() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getProjects({});
      if (res.status == 200) {
        setState(() {
          projects = res.data!.projects!;
          updatePages(); // Update pages after fetching projects
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a loader while pages are still being initialized
    if (pages.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF603EA4),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
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
      ),
    );
  }
}

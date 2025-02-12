import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/profile_screen/profile_page_screen.dart';

import '../after_register_home_screen/home_page_screen.dart';
import '../order_screen/order_page_screen.dart';
import '../projects_screen/project_page_screen.dart';

class ProfilePageController extends GetxController {
  // Sample user details
  var userName = "Singh Construction".obs;
  var gstin = "09VBUEV92B4B".obs;
  var panNumber = "DFTRJ5467D".obs;
  var mobileNumber = "+91 9876543210".obs;

  void logout() {
    // Handle logout logic
    print("User Logged Out");
  }

  int currentIndex = 2;

  void updateIndex(int index, BuildContext context) {
    currentIndex = index;
    // notifyListeners();

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePageScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProjectPageScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OrderPageScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePageScreen()));
        break;
    }
  }
}

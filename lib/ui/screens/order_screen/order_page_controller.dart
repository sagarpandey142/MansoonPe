import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../after_register_home_screen/home_page_screen.dart';
import '../profile_screen/profile_page_screen.dart';
import '../projects_screen/project_page_screen.dart';
import 'order_page_screen.dart';

class OrderPageController extends GetxController {

  int currentIndex = 1;

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';

import '../../../model_class/project_model.dart';
import '../home_screens/home_page_screen.dart';
import '../order_screen/order_page_screen.dart';
import '../profile_screen/profile_page_screen.dart';

class ProjectPageController extends GetxController {
  var projects = <ProjectModel>[
    ProjectModel(
      title: "JMD Building, Gurgaon",
      date: "16 Sep 23, 11:36 am",
      cost: "₹ 1,00,000",
      consumption: "₹ 1,00,000/₹ 5,00,000",
      status: "Active",
      statusColor: 0xFF28A745, // Green
      pending: "\$23000",
      buttonText: "Pay Now",
      statusType: "active",
    ),
    ProjectModel(
      title: "JMD Building, Gurgaon",
      date: "16 Sep 23, 11:36 am",
      cost: "₹ 1,00,000",
      consumption: "₹ 1,00,000/₹ 5,00,000",
      status: "In-review",
      statusColor: 0xFFFFA500, // Orange
      message: "Please wait while we are reviewing it",
      statusType: "review",
    ),
    ProjectModel(
      title: "JMD Building, Gurgaon",
      date: "16 Sep 23, 11:36 am",
      cost: "₹ 1,00,000",
      consumption: "₹ 1,00,000/₹ 5,00,000",
      status: "Not Approved",
      statusColor: 0xFFDC3545, // Red
      message: "This project is not approved yet",
      statusType: "not_approved",
    ),
  ].obs;

  int currentIndex = 0;

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

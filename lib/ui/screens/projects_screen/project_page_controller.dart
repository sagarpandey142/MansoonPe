import 'package:get/get.dart';
import '../../../model_class/project_model.dart';


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
      image: "assets/images/proj_imag_1.png",
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
      image: "assets/images/proj_imag_2.png",
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
      image: "assets/images/proj_imag_3.png",
    ),
  ].obs;


}

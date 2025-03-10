import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';
import '../../../modals/add_material_res.dart';
import '../../../modals/all_order_res.dart';
import '../../../utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../projects_screen/project_page_controller.dart';
import 'open_order_controller.dart';

class OpenOrderScreen extends StatefulWidget {
  final Order? order;

  const OpenOrderScreen({super.key, this.order});

  @override
  _OpenOrderScreenState createState() => _OpenOrderScreenState();
}

class _OpenOrderScreenState extends State<OpenOrderScreen> {
  final OpenOrderController openOrderController =
      Get.put(OpenOrderController());
  final ProjectPageController projectPageController =
      Get.find<ProjectPageController>();

  int _currentIndex = 2;
  List<Orders> orders = [];
  String createdOn = "2025-02-25T05:07:14.337787";

  @override
  void initState() {
    super.initState();
    getAllOrders();
  }

  getAllOrders() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';
      // var mob= prefs.getString("phone") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getAllOrders({});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        setState(() {
          orders = res.data!.orders!;
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
      // Get.snackbar("Error", "Something went wrong!",
      //     snackPosition: SnackPosition.TOP,
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        CustomColor.primaryColor,
                        CustomColor.secondaryColor
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Orders",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xCC000000),
                    ),
                  ),
                ),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade100, thickness: 2),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Row(
              children: [
                _buildFilterButton("Date"),
                SizedBox(width: 10),
                _buildFilterButton("Status"),
                SizedBox(width: 10),
                _buildFilterButton("Project"),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(() {
                    if (projectPageController.projects.isEmpty) {
                      return const Text("No projects available");
                    }

                    final project = projectPageController.projects.first;

                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Project name: ",
                            style: TextStyle(
                              color: Color(0xCC363F72),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${project.name ?? "N/A"}, ${project.location ?? "N/A"}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF363F72),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Icon(Icons.arrow_forward_rounded,
                    size: 15, color: Colors.black54),
              ],
            ),
          ),
          SizedBox(height: 8), // kam height kar diya

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date: ${OpenOrderController.formatDate(createdOn)}",
                  style: const TextStyle(
                    color: Color(0xE6363F72),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return buildOrderCard(orders[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 1.5,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOrderCard(Orders order) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(bottom: 15), // Adds space between cards
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade200, // Keeps grey border
            width: 1,
          ),
        ),
        child: IntrinsicHeight( // Ensures all containers have the same height
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F9FC),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Order ID: ${order.id ?? 'N/A'}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF363F72),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Chip(
                      label: Text(
                        order.status ?? "Pending",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5925DC),
                        ),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity(horizontal: -3, vertical: -4),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: -4),
                      backgroundColor: Color(0xFFF2F4F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Color(0xFFCBD5E1),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 40, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F5F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0x66363F72)),
                            ),
                            Text(
                              order.createdOn != null
                                  ? DateFormat('dd-MM-yyyy hh:mm a')
                                  .format(DateTime.parse(order.createdOn!))
                                  : "N/A",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: Color(0x99363F72),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Material Name: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: order.material ?? "N/A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Cost of material: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: "₹${order.cost ?? 0}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Requested payment due date: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: order.dueDate != null
                                    ? DateFormat('dd MMM, yyyy')
                                    .format(DateTime.parse(order.dueDate!))
                                    : "N/A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (order.status == "In-Progress") ...[
                          SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {}, // TODO: Add Payment Logic
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF603EA4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Pay Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

}

Widget _buildFilterButton(String label) {
  return SizedBox(
    height: 35, // Reduce height
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Colors.grey.shade300, width: 1.3),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
            vertical: 2, horizontal: 10), // Reduce width padding
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Shrinks button to fit content
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Color(0x99000000),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 3),
          Icon(Icons.keyboard_arrow_down,
              color: Colors.grey.shade500, size: 16), // Slightly smaller icon
        ],
      ),
    ),
  );
}

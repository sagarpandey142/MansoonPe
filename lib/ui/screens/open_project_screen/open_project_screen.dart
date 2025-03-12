import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projects/ui/screens/open_project_screen/open_project_controller.dart';
import '../../../modals/order_res.dart';
import '../../../model_class/project_model.dart';
import '../home_screens/home_page_controller.dart';
import '../home_screens/home_page_screen.dart';

class OpenProjectScreen extends StatefulWidget {
  final String projectStatus;
  final String projectId; // Make sure this is nullable if `orders` can be empty

  const OpenProjectScreen(
      {super.key, required this.projectStatus, required this.projectId});

  @override
  _OpenProjectScreenState createState() => _OpenProjectScreenState();
}

class _OpenProjectScreenState extends State<OpenProjectScreen> {
  final OpenProjectController controller = Get.put(OpenProjectController());
  List<MaterialModel> materialsList = [];
  @override
  void initState() {
    super.initState();
    // if (widget.projectStatus.toString().toLowerCase() == 'active') {
    controller.getOrders(widget.projectId.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return controller.project.value.id != null
              ? Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left_outlined,
                                size: 35,
                                color: Color(0x99000000),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width *
                                      0.3, // Max width
                                ),
                                child: Text(
                                  "${controller.project.value.name}",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xCC000000),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            String status = controller.project.value.status
                                .toString()
                                .toLowerCase();
                            print("Project Status: $status");

                            if (status == "in_review") {
                              print("Showing Popup...");
                              OpenProjectController.showTopMessage(context,
                                  "We are currently reviewing this project.");
                            } else if (status == 'active') {
                              controller.showAddMaterialPopup(
                                  context, controller.project.value.id);
                            }
                          },
                          child: Text(
                            "+ Add new material",
                            style: GoogleFonts.poppins(
                              color: Color(0xCC603EA4),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Divider(color: Colors.grey.shade300, thickness: 2),
                    // Purchase Details
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Total Purchases: ${controller.project.value.budget}",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFF363F72),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.downloadPDF(controller.project.value);
                                  },
                                  child: Text("Download Contract",
                                      style: GoogleFonts.poppins(
                                          color: Color(0xFF603EA4),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10)),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "Created on: ",
                                    style: const TextStyle(
                                      color: Color(0x99000000),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: HomePageController.formatDate(
                                            controller.project.value.createdOn!),
                                        // Calling controller function
                                        style: const TextStyle(
                                          color: Color(0xCC000000),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Status: ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0x99000000)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Color(
                                      controller.project.value.status ==
                                              "IN_REVIEW"
                                          ? 0xFFFFFAEB // Even lighter orange
                                          : controller.project.value.status ==
                                                  "ACTIVE"
                                              ? 0xFFECFDF3 // Even lighter green
                                              : 0xFFFEF3F2, // Even lighter red
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 0.7, // Thinner border
                                      color: Color(
                                        controller.project.value.status ==
                                                "IN_REVIEW"
                                            ? 0xFFFFD699 // Lighter orange border
                                            : controller.project.value.status ==
                                                    "ACTIVE"
                                                ? 0xFF027A48 // Lighter green border
                                                : 0xFFF5A8A8, // Lighter red border
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    controller.project.value.status ==
                                            "IN_REVIEW"
                                        ? "In-review"
                                        : controller.project.value.status ==
                                                "ACTIVE"
                                            ? "Active"
                                            : "Inactive", // Adjust as needed
                                    style: GoogleFonts.poppins(
                                      color: Color(
                                        controller.project.value.status ==
                                                "IN_REVIEW"
                                            ? 0xFFB54708
                                            : controller.project.value.status ==
                                                    "ACTIVE"
                                                ? 0xFF28A745
                                                : 0xFFDC3545,
                                      ),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8), // Consistent spacing
                            Text.rich(
                              TextSpan(
                                text: "Assigned Credit: ",
                                style: const TextStyle(
                                  color: Color(0x99000000),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "₹ ${NumberFormat('#,##,###').format(controller.project.value.credit != null ? controller.project.value.credit!.credited! : 0)}",
                                    style: const TextStyle(
                                      color: Color(0xCC000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8), // Consistent spacing

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "Consumed: ",
                                    style: const TextStyle(
                                      color: Color(0x99000000),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "₹ ${NumberFormat('#,##,###').format(controller.project.value.credit != null ? controller.project.value.credit!.consumed : 0)}",
                                        style: const TextStyle(
                                          color: Color(0xCC000000),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "Credit left: ",
                                    style: const TextStyle(
                                      color: Color(0x99000000),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "₹ ${controller.project.value.credit != null ? NumberFormat('#,##,###').format(controller.project.value.credit!.credited! - controller.project.value.credit!.consumed!) : NumberFormat('#,##,###').format(0)}",
                                        style: const TextStyle(
                                          color: Color(0xCC000000),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      );
                    }),
                    Divider(thickness: 1),
                    Expanded(
                      child: Obx(() {
                        return controller.orders.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/order_file.svg',
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "You haven't requested any quote yet.",
                                    style: TextStyle(
                                      color: Color(0x66000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                itemCount: controller.orders.length,
                                itemBuilder: (context, index) {
                                  return buildOrderCard(
                                      controller.orders[index]);
                                },
                              );
                      }),
                    ),
                    Divider(color: Colors.grey.shade300),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageScreen(),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                minimumSize: const Size(double.infinity, 50),
                                // Increased height
                                side: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 1.3), // Grey border
                              ),
                              child: const Text(
                                "Go to Homepage",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0x99000000),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                String status = controller.project.value.status
                                    .toString()
                                    .toLowerCase();
                                print("Project Status: $status");

                                if (status == "in_review") {
                                  print("Showing Popup...");
                                  OpenProjectController.showTopMessage(context,
                                      "We are currently reviewing this project.");
                                } else if (status == 'active') {
                                  controller.showAddMaterialPopup(
                                      context, controller.project.value.id);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF603EA4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Add new material",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container();
        }),
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
        child: IntrinsicHeight(
          // Ensures all containers have the same height
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
                      visualDensity:
                          VisualDensity(horizontal: -3, vertical: -4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: -4),
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
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {},
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
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projects/ui/screens/open_project_screen/open_project_controller.dart';
import '../../../modals/project_res.dart';
import '../../../model_class/project_model.dart';
import '../home_screens/home_page_controller.dart';
import '../home_screens/home_page_screen.dart';

class OpenProjectScreen extends StatefulWidget {
  final Projects project; // Change Project to Projects

  const OpenProjectScreen({Key? key, required this.project}) : super(key: key);

  @override
  _OpenProjectScreenState createState() => _OpenProjectScreenState();
}

class _OpenProjectScreenState extends State<OpenProjectScreen> {
  final OpenProjectController controller = Get.put(OpenProjectController());
  List<MaterialModel> materialsList = [];

  String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left_outlined,
                          size: 35, color: Color(0x99000000)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      "${widget.project.name}",
                      style: TextStyle(
                        color: Color(0xCC000000),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.put(OpenProjectController())
                        .showAddMaterialPopup(context); // Pass local context
                  },
                  child: Text(
                    "+ Add new material",
                    style: TextStyle(
                      color: Color(0xCC603EA4),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 2,
            ),
            // Purchase Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Purchases: ${widget.project.budget}",
                          style: TextStyle(
                              color: Color(0xFF363F72),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      TextButton(
                        onPressed: () {
                          controller.downloadPDF(widget.project);
                        },
                        child: Text("Download Contract",
                            style: TextStyle(
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
                              text: HomePageController.formatDate(createdOn),
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
                            widget.project.status == "IN_REVIEW"
                                ? 0xFFFFF2CC // Even lighter orange
                                : widget.project.status == "ACTIVE"
                                    ? 0xFFEAF7EE // Even lighter green
                                    : 0xFFFDECEA, // Even lighter red
                          ),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 0.7, // Thinner border
                            color: Color(
                              widget.project.status == "IN_REVIEW"
                                  ? 0xFFFFD699 // Lighter orange border
                                  : widget.project.status == "ACTIVE"
                                      ? 0xFFA8E6B5 // Lighter green border
                                      : 0xFFF5A8A8, // Lighter red border
                            ),
                          ),
                        ),
                        child: Text(
                          widget.project.status == "IN_REVIEW"
                              ? "In-review"
                              : widget.project.status == "ACTIVE"
                                  ? "Active"
                                  : "Inactive", // Adjust as needed
                          style: GoogleFonts.poppins(
                            color: Color(
                              widget.project.status == "IN_REVIEW"
                                  ? 0xFFB54708
                                  : widget.project.status == "ACTIVE"
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
                              "₹ ${NumberFormat('#,##,###').format(widget.project.budget)}",
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
                                  "₹ ${NumberFormat('#,##,###').format(widget.project.budget)}",
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
                                  "₹ ${NumberFormat('#,##,###').format(widget.project.budget)}",
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
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),

            Expanded( // Wrap the entire Obx() to prevent layout breaking
              child: Obx(() {
                return controller.materialsList.isEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/order_file.svg',
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    SizedBox(height: 8),
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
                  itemCount: controller.materialsList.length,
                  itemBuilder: (context, index) {
                    return buildOrderCard(controller.materialsList[index].status);
                  },
                );
              }),
            ),

            Divider(
              color: Colors.grey.shade300,
            ),
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
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
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
                        Get.put(OpenProjectController()).showAddMaterialPopup(
                            context); // Pass local context
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
        ),
      ),
    );
  }

  Widget buildOrderCard(String status) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade300, // Grey border color
            width: 1, // Adjust width as needed
          ),
        ),
        height: 250,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Add padding for spacing
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F9FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Order ID: 123456", // Change this dynamically
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
                      status,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5925DC),
                      ),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -3, vertical: -4), // Reducing vertical spacing
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: -4), // Reduce top & bottom padding
                    backgroundColor: Color(0xFFF2F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Slightly smaller border radius
                      side: BorderSide(
                        color: Color(0xFFCBD5E1),
                        width: 0.5, // Thinner border
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 50, left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F5F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                              color: Color(0x66363F72)
                            ),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy hh:mm a').format(
                                DateTime.now()), // Formats date and time
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                                color: Color(0x99363F72),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
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
                              text: "TMT Bars",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFF363F72),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
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
                              text: "₹8,500",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFF363F72),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
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
                              text: "25 Oct,2024",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFF363F72),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (status == "In-Progress") ...[
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
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
          ],
        ),
      ),
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projects/ui/screens/home_screens/home_page_screen.dart';
import '../../../model_class/project_model.dart';

class ProjectPageController extends GetxController {
  TextEditingController dateController = TextEditingController();

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
      image: "assets/images/proj_img_1.png",
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
      image: "assets/images/proj_img_2.png",
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
      image: "assets/images/proj_img_3.png",
    ),
  ].obs;

  void showAddMaterialPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Important for keyboard handling
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).viewInsets.bottom, // Push content up
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20), // Extra padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:
                        MainAxisSize.min, // Important to wrap content correctly
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add New Material",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16)),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            textFieldWidget("Material Name"),
                            SizedBox(height: 10),
                            textFieldWidget("Cost of Material"),
                            SizedBox(height: 5),
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      CupertinoIcons.exclamationmark_circle,
                                      color: Color(0xFF1E40AF),
                                      size: 13.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Inclusive of GST and shipping charges",
                                      style: TextStyle(
                                        color: Color(0xFF1E40AF),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            textFieldWidget("Requested Payment Due Date",
                                isDateField: true, controller: dateController),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0EEF6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/upload_attach.svg'),
                                    SizedBox(width: 5),
                                    Text(
                                      "Upload Contract",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF603EA4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Get.to(() => OpenProjectScreen()); // Correct way to navigate
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF603EA4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Continue",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
              ),
            );
          },
        );
      },
    );
  }

  void showProjectPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Popup",
      pageBuilder: (context, animation, secondaryAnimation) {
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
                          "JMD Build...",
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
                        Get.find<ProjectPageController>()
                            .showAddMaterialPopup(Get.context!);
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
                Divider(),
                // Purchase Details
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Purchases: 0",
                              style: TextStyle(
                                  color: Color(0xFF363F72),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          TextButton(
                            onPressed: () {},
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Created on: ",
                                  style: TextStyle(
                                    color: Color(0x99000000), // Grey color
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "16 Sep 23, 11:36 AM",
                                  style: TextStyle(
                                    color: Color(0xCC000000), // Black color
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
                              color: Color(0xFFECFDF3),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Text(
                              "Active",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Assigned Credit: ",
                              style: TextStyle(
                                color: Color(0x99000000), // Grey color
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "₹8,00,00",
                              style: TextStyle(
                                color: Color(0xCC000000), // Black color
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Consumed: ",
                                  style: TextStyle(
                                    color: Color(0x99000000), // Grey color
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "₹0",
                                  style: TextStyle(
                                    color: Color(0xCC000000), // Black color
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Credit left: ",
                                  style: TextStyle(
                                    color: Color(0x99000000), // Grey color
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "₹7,00,00",
                                  style: TextStyle(
                                    color: Color(0xCC000000), // Black color
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
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
                Divider(),

                Spacer(),
                // Empty State
                Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/order_file.svg',
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("You haven't requested any quote yet.",
                        style: TextStyle(
                          color: Color(0x66000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
                  ],
                ),
                Spacer(),
                // Bottom Buttons

                Divider(),
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
                                  builder: (context) =>
                                      HomePageScreen()), // Navigate to HomepageScreen
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius 15
                            ),
                            minimumSize:
                                Size(double.infinity, 50), // Increased height
                          ),
                          child: Text(
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
                            Get.find<ProjectPageController>()
                                .showAddMaterialPopup(Get.context!);
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
      },
    );
  }

  Widget textFieldWidget(String label,
      {bool isDateField = false, TextEditingController? controller}) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        readOnly: isDateField,
        onTap: isDateField
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: Get.context!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  controller?.text =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                }
              }
            : null,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: isDateField
              ? Icon(Icons.calendar_today, color: Colors.grey)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          labelStyle: TextStyle(
            color: Color(0xCC000000),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

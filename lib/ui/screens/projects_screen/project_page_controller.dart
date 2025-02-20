import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/home_screens/home_page_screen.dart';
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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
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
                        onPressed: () {},
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF603EA4),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius 15
                            ),
                            minimumSize:
                                Size(double.infinity, 50), // Increased height
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
}

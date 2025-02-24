import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../projects_screen/project_page_controller.dart';

class OpenProjectScreen extends StatelessWidget {
  const OpenProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
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
                  onPressed: () {
                    Get.find<ProjectPageController>()
                        .showAddMaterialPopup(context);
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
          ),
          Divider(),

          // Purchase Details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                              color: Color(0x99000000),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "16 Sep 23, 11:36 AM",
                            style: TextStyle(
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
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Assigned Credit: ",
                        style: TextStyle(
                          color: Color(0x99000000),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "₹8,00,00",
                        style: TextStyle(
                          color: Color(0xCC000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Consumed: ",
                            style: TextStyle(
                              color: Color(0x99000000),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "₹0",
                            style: TextStyle(
                              color: Color(0xCC000000),
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
                              color: Color(0x99000000),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "₹7,00,00",
                            style: TextStyle(
                              color: Color(0xCC000000),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),

          Expanded(
            child: ListView(
              children: [
                buildOrderCard("Closed"),
                buildOrderCard("In-Progress"),
                buildOrderCard("In-Review"),
                buildOrderCard("Not Approved"),
                buildOrderCard("Approved"),
              ],
            ),
          ),
        ],
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
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ID: 1234",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF603EA4),
                    ),
                  ),
                  Chip(
                    label: Text(status),
                    labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor:
                        Color(0xFFF2F4F7), // Adjust color as needed
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Border radius of 20
                      side: BorderSide(
                          color: Color(0xFF344054)), // Optional border color
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 50, left: 10),
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
                            ),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy hh:mm a').format(
                                DateTime.now()), // Formats date and time
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text("Material Name: TMT Bars",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                      Text("Cost of material: ₹8,500",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Text("Requested payment due date: 25 Oct, 2024",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      if (status == "In-Progress") ...[
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() =>
                                  OpenProjectScreen()); // Correct way to navigate
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF603EA4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Pay",
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

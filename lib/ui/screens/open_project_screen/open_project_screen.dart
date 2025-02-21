import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F9FC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Order ID: 1234",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF603EA4),
                    ),
                  ),
                ),
                Chip(label: Text(status)),
              ],
            ),
            SizedBox(height: 8),
            Text("Material Name: TMT Bars",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Cost of material: ₹8,500"),
            Text("Requested payment due date: 25 Oct, 2024"),
            if (status == "In-Progress") ...[
              SizedBox(height: 8),
              ElevatedButton(onPressed: () {}, child: Text("Pay Now")),
            ]
          ],
        ),
      ),
    );
  }
}

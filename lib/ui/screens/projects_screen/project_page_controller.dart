import 'package:flutter/material.dart';
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
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        "JMD Build...",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("+ Add new material", style: TextStyle(color: Colors.purple)),
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
                      Text("Total Purchases: 0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Created on: 16 Sep 23, 11:36 AM"),
                          TextButton(
                            onPressed: () {},
                            child: Text("Download Contract", style: TextStyle(color: Colors.purple)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text("Assigned Credit: ₹ 8,00,00", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text("Consumed: ₹ 0"),
                          Spacer(),
                          Text("Status: ", style: TextStyle(fontSize: 16)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Active", style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text("Credit left: ₹ 7,00,00", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Spacer(),
                // Empty State
                Column(
                  children: [
                    Icon(Icons.insert_drive_file, size: 60, color: Colors.grey),
                    SizedBox(height: 8),
                    Text("You haven't requested any quote yet.", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                // Bottom Buttons
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Go to Homepage"),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                          child: Text("Add new material"),
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

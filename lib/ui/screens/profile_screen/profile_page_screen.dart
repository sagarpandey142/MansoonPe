import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/profile_screen/profile_page_controller.dart';

import '../../../widgets_page/custom_bottom_navigator_bar.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.put(ProfilePageController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFEDE7F6),
                        child: Obx(() => Text(
                          controller.userName.value[0],
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF603EA4),
                          ),
                        )),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Text(
                            controller.userName.value,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF603EA4),
                            ),
                          )),
                          SizedBox(height: 4),
                          Obx(() => Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFEDE7F6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'GSTIN: ${controller.gstin.value}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF603EA4),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(() => InfoRow(label: 'PAN Number:', value: controller.panNumber.value)),
                  SizedBox(height: 5),
                  Obx(() => InfoRow(label: 'Mob No:', value: controller.mobileNumber.value)),
                ],
              ),
            ),
            SizedBox(height: 20),
            OptionTile(icon: Icons.receipt_long, title: 'Orders Placed'),
            OptionTile(icon: Icons.account_balance, title: 'Bank Accounts'),
            GestureDetector(
                onTap: () => controller.logout(),
                child: OptionTile(icon: Icons.logout, title: 'Logout')),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 8, color: Color(0xFF603EA4)),
        SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(
                text: ' $label ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              TextSpan(
                text: value,
                style: TextStyle(color: Color(0xFF603EA4)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;

  OptionTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

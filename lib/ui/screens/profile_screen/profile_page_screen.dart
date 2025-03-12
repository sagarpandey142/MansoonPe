import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _currentIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.put(ProfilePageController());
    controller.getProfile();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15),
            child: Row(
              children: [
                Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xCC000000),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade200, thickness: 2),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300, // Grey border color
                  width: 1, // Adjust width as needed
                ),
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
                                color: Color(0xFF402387),
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
                                  color: Color(0xFF402387),
                                ),
                              )),
                          SizedBox(height: 4),
                          Obx(() => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F9FC),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'GSTIN: ${controller.gstin.value}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF363F72),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Obx(() => Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F9FC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InfoRow(
                            label: 'PAN Number:',
                            value: controller.panNumber.value,
                            labelColor: Color(0xFF363F72), // Now this will work
                          ),
                        ),
                      )),
                  SizedBox(height: 5),
                  Obx(() => Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.55, // Reduced width
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F9FC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InfoRow(
                            label: 'Mob No:',
                            value: controller.mobileNumber.value,
                            labelColor: Color(0xFF363F72),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
            child: GestureDetector(
              onTap: () {
                // Handle "Orders Placed" button tap
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/profile_receipt.svg"),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Orders Placed",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xCC000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: GestureDetector(
              onTap: () {
                // Handle "Bank Accounts" button tap
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/profile_bank.svg"),
                    SizedBox(width: 15),
                    Text(
                      "Bank Accounts",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xCC000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: InkWell(
              onTap: () {
                Get.put(ProfilePageController()).showLogoutBottomSheet(context);
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade300, // Grey border color
                    width: 1, // Adjust width as needed
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset("assets/images/profile_log.svg"),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xCC000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Material(
      //   color: Colors.transparent, // Avoid default material color
      //   child: Container(
      //     height: 80, // Keep the height same
      //     decoration: BoxDecoration(
      //       color: Colors.white, // Ensure white background
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         topRight: Radius.circular(20),
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.2), // Very light shadow
      //           spreadRadius: 0, // No extra spread
      //           blurRadius: 1.5, // Slight blur for a thin effect
      //           offset: Offset(0, -1), // Moves shadow slightly upwards
      //         ),
      //       ],
      //     ),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         topRight: Radius.circular(20),
      //       ),
      //       child: CustomBottomNavigationBar(
      //         currentIndex: _currentIndex,
      //         onTap: (index) {
      //           setState(() {
      //             _currentIndex = index;
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor; // Change type from String to Color

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.labelColor, // Now accepts a Color directly
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 8, color: Color(0xFF363F72)),
        SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(
                text: ' $label ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: labelColor), // Use labelColor here
              ),
              TextSpan(
                text: value,
                style: TextStyle(color: Color(0xFF363F72)),
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

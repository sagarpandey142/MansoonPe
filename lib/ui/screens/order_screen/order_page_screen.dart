import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_controller.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';
import 'package:projects/utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';

class OrderPageScreen extends StatefulWidget {
  const OrderPageScreen({super.key});

  @override
  _OrderPageScreenState createState() => _OrderPageScreenState();
}

class _OrderPageScreenState extends State<OrderPageScreen> {
  int _currentIndex = 2; // Track the selected index

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProjectController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey.shade100, thickness: 2),
              SizedBox(height: 70),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/order_file.svg',
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You haven't place any order yet.\nGo to project section to add your order",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0x99000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0EEF6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => ProjectPageScreen());
                        },
                        child: Text(
                          "Go to Projects",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF785CB2),
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
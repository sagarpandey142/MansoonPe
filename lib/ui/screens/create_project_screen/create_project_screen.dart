import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_controller.dart';
import 'package:projects/utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  bool _isButtonPressed = false; // Track button press state
  int _currentIndex = 1;

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
                        "Projects",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xCC000000),
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Color(0x66000000))
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
                        'assets/images/Component 160.svg',
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You haven't created any project yet.\nCreate your first project to start with",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _isButtonPressed
                            ? Color(0xFF603EA4)
                            : Color(0xFFF0EEF6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isButtonPressed = true;
                          });

                          Get.put(CreateProjectController())
                              .showCreateProjectBottomSheet(context);
                        },
                        child: Text(
                          "+   Create first project",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _isButtonPressed
                                ? Colors.white
                                : Color(0xFF785CB2),
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

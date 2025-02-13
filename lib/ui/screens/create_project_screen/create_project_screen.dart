import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_controller.dart';
import 'package:projects/utils/custom_colour.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  bool _isButtonPressed = false; // Track button press state

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
                    Icon(Icons.search, color: Color(0x66000000)),
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
                        color: _isButtonPressed ? Color(0xFF603EA4) : Color(0xFFF0EEF6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isButtonPressed = true;
                          });

                          Get.put(CreateProjectController()).showCreateProjectBottomSheet(context);
                        },
                        child: Text(
                          "+   Create first project",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _isButtonPressed ? Colors.white : Color(0xFF785CB2),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Prevents items from shifting
        selectedItemColor: Color(0xFF603EA4),
        unselectedItemColor: Color(0x99000000),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          // onTap(index);
          // _navigateToScreen(index);
        },
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/custom_bottom_navigation/home_color.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/custom_bottom_navigation/project.svg"),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/custom_bottom_navigation/order.svg"),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/custom_bottom_navigation/profile.svg"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

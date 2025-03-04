import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/home_screens/home_page_controller.dart';
import 'package:projects/ui/screens/login_screen/login_page_screen.dart';
import 'package:projects/utils/custom_colour.dart';

class GuestSkipScreen extends StatefulWidget {
  const GuestSkipScreen({super.key});

  @override
  _GuestSkipScreenState createState() => _GuestSkipScreenState();
}

class _GuestSkipScreenState extends State<GuestSkipScreen> {
  int _currentIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
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
                          ], // Gradient colors
                        ).createShader(bounds);
                      },
                      child: Text(
                        "MasonPe.",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors
                              .white, // Keep it white, ShaderMask applies the gradient
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width *
                              0.02), // Adjust padding based on screen width
                      child: SvgPicture.asset("assets/images/menu_vector.svg"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 200,
                  width: 610,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/home_background_image.png'), // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Want Building Materials?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9E9C9C),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Register Now to",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "• Buy products on credit",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic, // Makes the text italic
                          color: Color(0xFF9E9C9C),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "• Expand your business",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF9E9C9C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => LoginPageScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.grey,
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Register Now",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Projects",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF62449D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/file_image.png',
                        width: MediaQuery.of(context).size.width *
                            0.2, // 20% of screen width
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You haven't created any project yet.\nCreate your first project to start with",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 200, // Adjust width as needed
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0EEF6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() =>
                              LoginPageScreen()); // Handle create first project action
                        },
                        child: Text(
                          "+   Create first project",
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
      bottomNavigationBar: Material(
        color: Colors.transparent, // Avoid default material color
        child: Container(
          height: 80, // Keep the height same
          decoration: BoxDecoration(
            color: Colors.white, // Ensure white background
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Very light shadow
                spreadRadius: 0, // No extra spread
                blurRadius: 1.5, // Slight blur for a thin effect
                offset: Offset(0, -1), // Moves shadow slightly upwards
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white, // ✅ Fix background color issue
              currentIndex: _currentIndex,
              onTap: (index) {
                if (index == 0) {
                  // Sirf "Home" button clickable hoga
                  setState(() {
                    _currentIndex = index;
                  });
                }
              },
              selectedItemColor: Color(0xFF603EA4), // Active tab color
              unselectedItemColor: Colors.black54, // Non-selected tab color
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
                  icon: SvgPicture.asset(
                    _currentIndex == 0
                        ? "assets/custom_bottom_navigation/home_color.svg"
                        : "assets/custom_bottom_navigation/home.svg",
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/custom_bottom_navigation/project.svg",
                  ),
                  label: "Projects",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/custom_bottom_navigation/order.svg",
                  ),
                  label: "Orders",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/custom_bottom_navigation/profile.svg",
                  ),
                  label: "Profile",
                ),
              ],
              type: BottomNavigationBarType.fixed, // Fixes label disappearing issue
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_screen/home_page_screen.dart';
import 'register_page_controller.dart';

class RegisterPageScreen extends StatelessWidget {
  const RegisterPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(
      init: RegisterPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), // Adjust the height as needed
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10), // Adjust the left padding if needed
                child: IconButton(
                  icon: const Icon(Icons.chevron_left_outlined,
                      color: Colors.black, size: 35),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              title: Row(
                children: [
                  // Space between the arrow and text
                  Text(
                    "Register to continue",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xCC000000),
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1), // Set the height of the border line
                child: Container(
                  color: Color(0xFFEFEFEF), // Grey color for the border line
                  height: 3, // Border thickness
                ),
              ),
            ),
          ),
            body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                    "Business Name *", controller.businessNameController),
                const SizedBox(height: 15),
                _buildTextField("GST Number *", controller.gstNumberController),
                const SizedBox(height: 15),
                _buildTextField("PAN Number *", controller.panNumberController),
                const SizedBox(height: 20),

                // Terms & Conditions Checkbox
                Row(
                  children: [
                    Obx(() => Checkbox(
                          activeColor: Color(0xFF603EA4),
                          value: controller.isChecked.value,
                          onChanged: (value) {
                            controller.toggleCheckbox(value!);
                          },
                        )),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "By continuing, you agree to our ",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0x99000000),
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: "Terms of Service, ",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF603EA4),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy ",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF603EA4),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "and ",
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Cookie Policy.",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF603EA4),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Continue Button
                Obx(
                      () => ElevatedButton(
                    onPressed: controller.isChecked.value
                        ? () {
                      controller.continueRegistration(); // Call the continueRegistration method
                      Get.to(() => HomePageScreen()); // Navigate to HomePageScreen
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF603EA4),
                      disabledBackgroundColor: Colors.grey,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      style: TextStyle(height: 2.5),
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
            fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
        ),
      ),
    );
  }
}

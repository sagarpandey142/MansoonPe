import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../register_screen/register_page_screen.dart';
import 'otp_page_controller.dart';

class OtpPageScreen extends StatelessWidget {
  final String phoneNumber = "+91 9876543210";

  const OtpPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpPageController>(
      init: OtpPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), // Adjust the height as needed
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.black, size: 40),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                "OTP Verification",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xCC000000),
                ),
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

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                "We have sent a verification code to",
                style: GoogleFonts.poppins(fontSize: 14, color: Color(
                    0x99000000), fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                phoneNumber,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF603EA4),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),
              // OTP Input Field
              OtpTextField(
                numberOfFields: 4,
                borderColor: Colors.black38,
                focusedBorderColor: Color(0x33000000),
                showFieldAsBox: true,
                fieldWidth: 60,  // Width of the field
                fieldHeight: 60, // Height of the field (to maintain a square shape)
                borderRadius: BorderRadius.circular(14), // Set the border radius to 25 for circular shape
                onSubmit: (String otp) {
                  controller.setOtp(otp); // Set OTP in the controller

                  // Check if the OTP has 4 digits, then navigate to RegisterPageScreen
                  if (otp.length == 4) {
                    Get.to(() => RegisterPageScreen()); // Navigate to the RegisterPageScreen
                  }
                },
              ),

              const SizedBox(height: 40),
              // Resend OTP
              Text(
                "Didn’t get the OTP?",
                style: GoogleFonts.poppins(fontSize: 14, color: Color(
                    0x99000000), fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  controller.resendOtp(); // Call resend OTP function
                },
                child: Text(
                  "Resend OTP",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF603EA4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

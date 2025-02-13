import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
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
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.chevron_left,
                    color: Colors.black, size: 40),
                onPressed: () => Get.back(),
              ),
              title: Text(
                "OTP Verification",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xCC000000)),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: const Color(0xFFEFEFEF),
                  height: 3,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView( // 👈 Overflow fix: Add scroll view
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // 👈 Add padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "We have sent a verification code to",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x99000000)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    phoneNumber,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF603EA4)),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),
                  // OTP Input Field
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black38,
                  focusedBorderColor: const Color(0x33000000),
                  showFieldAsBox: true,
                  fieldWidth: 45,
                  fieldHeight: 55,
                  borderRadius: BorderRadius.circular(14),
                  onSubmit: (String otp) {
                    controller.setOtp(otp);
                    if (otp.length == 6) { // ✅ Change condition to 6
                      Get.to(() => RegisterPageScreen());
                    }
                  },
                ),

                  const SizedBox(height: 40),
                  // Resend OTP
                  Text(
                    "Didn’t get the OTP?",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x99000000)),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => controller.resendOtp(),
                    child: Text(
                      "Resend OTP",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF603EA4)),
                    ),
                  ),
                  const SizedBox(height: 20), // 👈 Extra space to prevent cut-off
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

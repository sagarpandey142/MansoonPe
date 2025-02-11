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
            preferredSize: Size.fromHeight(60),
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
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xCC000000)),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Container(
                  color: Color(0xFFEFEFEF),
                  height: 3,
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
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0x99000000)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                phoneNumber,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF603EA4)),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),
              // OTP Input Field
              OtpTextField(
                numberOfFields: 4,
                borderColor: Colors.black38,
                focusedBorderColor: Color(0x33000000),
                showFieldAsBox: true,
                fieldWidth: 60,
                fieldHeight: 60,
                borderRadius: BorderRadius.circular(14),
                onSubmit: (String otp) {
                  controller.setOtp(otp);
                  if (otp.length == 4) {
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
                    color: Color(0x99000000)),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => controller.resendOtp(),
                child: Text(
                  "Resend OTP",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF603EA4)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/home_screen/guest_skip_screen.dart';
import 'login_page_controller.dart'; // Import the controller

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageController controller = LoginPageController();

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 390,
            width: double.infinity,
            color: Color(0xFFE1ECFD),
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => GuestSkipScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Colors.grey, width: 1.1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    ),
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                        color: Color(0x99000006),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/constructor_img.svg',
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Financing Platform for\nContractors & Builders",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000001),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Log in or Sign up",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000001),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
            child: SizedBox(
              height: 60,
              width: 350,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: GoogleFonts.poppins(
                    color: Color(0x99000006),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  isDense: true,
                ),
                style: const TextStyle(color: Color(0xCC000008)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.generateOtp(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF603EA4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Generate OTP",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text.rich(
              TextSpan(
                text: "By continuing, you agree to our ",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "Terms of Service",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xCC4600F2),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const TextSpan(text: ", "),
                  TextSpan(
                    text: "\nPrivacy Policy",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xCC4600F2),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Cookie Policy.",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xCC4600F2),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

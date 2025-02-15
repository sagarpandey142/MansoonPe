import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../guest_screen/guest_skip_screen.dart';
import 'login_page_controller.dart'; // Import the controller

class LoginPageScreen extends StatefulWidget {
  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final LoginPageController controller = Get.put(LoginPageController());

  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 300), () {
          _scrollToBottom();
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents overflow due to the keyboard
      body: SingleChildScrollView(
        // Allows scrolling when the keyboard appears
        controller: _scrollController,
        // reverse: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            // Ensures content fits within the available space
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45, //310,
                  width: double.infinity,
                  color: Color(0xFFE1ECFD),
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 20),
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
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/constructor_img.svg',
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.6,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Financing Platform for\nContractors & Builders",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000001),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Log in or Sign up",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000001),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Obx(()=>
                          SizedBox(
                            height: 60,
                            width: 350,
                            child: TextField(
                              controller: controller.phoneController,
                              keyboardType: TextInputType.text,
                              // onTap: _scrollToBottom,
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                labelText: "Mobile Number",
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                labelStyle: GoogleFonts.poppins(
                                  color: Color(0x99000006),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:   BorderSide(color: controller.isError.value ? Colors.red : Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: controller.isError.value ? Colors.red : Colors.grey),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                isDense: true,
                              ),
                              style: GoogleFonts.poppins(
                                // Sets the text inside TextField to size 20
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xCC000008),
                              ),
                            ),
                          )
                      )
                      ,
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => controller.generateOTP(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF603EA4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            "Generate OTP",
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()), // Pushes text to the bottom
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
          ),
        ),
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        250.0 ,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/login_screen/login_page_screen.dart';

class ProfilePageController extends GetxController {
  // Sample user details
  var userName = "Singh Construction".obs;
  var gstin = "09VBUEV92B4B".obs;
  var panNumber = "DFTRJ5467D".obs;
  var mobileNumber = "+91 9876543210".obs;

  void showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, size: 30, color: Colors.black54),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      'assets/images/logout_icon.svg',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Do you Want to log out?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B0202),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "You will be logged out of this device",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0x99000000),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center the buttons horizontally
                    children: [
                      // Add a SizedBox for spacing between buttons
                      SizedBox(
                        width: 180, // Adjust width as per your requirement
                        height: 50, // Adjust height as per your requirement
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Make the background transparent
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300, // Grey border color
                              width: 1, // Border width
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back(); // Closes the popup
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // Removes the shadow of the ElevatedButton
                              backgroundColor: Colors.transparent, // Transparent background for the button itself
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "No",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1B0202),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10), // Space between the buttons
                      SizedBox(
                        width: 180, // Adjust width as per your requirement
                        height: 50, // Adjust height as per your requirement
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => LoginPageScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFC31812),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Yes",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}

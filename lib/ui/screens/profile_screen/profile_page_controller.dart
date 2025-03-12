import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/login_screen/login_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';

class ProfilePageController extends GetxController {
  // Sample user details
  var userName = "0".obs;
  var gstin = "".obs;
  var panNumber = "".obs;
  var mobileNumber = "".obs;
  getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';

      Repository repo = Repository(token: token);
      var res = await repo.getProfile({});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        var data = res.data!.profile;
        userName.value = data!.businessName!;
        gstin.value = data.gstNumber!;
        panNumber.value = data.panNumber!;
        var mob = prefs.getString("phone") ?? '';
        mobileNumber.value = mob;
      }
    } catch (e) {
      debugPrint("Error: $e");
      // Get.snackbar("Error", "Something went wrong!",
      //     backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

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
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
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
                            color: Colors
                                .transparent, // Make the background transparent
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
                              elevation:
                                  0, // Removes the shadow of the ElevatedButton
                              backgroundColor: Colors
                                  .transparent, // Transparent background for the button itself
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
                            logout(context);
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

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPageScreen()),
      (Route<dynamic> route) => false,
    );
  }
}

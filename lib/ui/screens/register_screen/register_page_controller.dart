import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/api_services/api_service.dart';
import 'package:projects/modals/reg_profile_req.dart';
import 'package:projects/widgets_page/custom_bottom_navigator_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screens/home_page_screen.dart';

class RegisterPageController extends GetxController {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  var isChecked = false.obs;
  RxBool isGstValid = true.obs;
  RxBool isPanValid = true.obs;
  RxBool isBusinessNameValid = true.obs;

  // Validate fields in real-time
  void validateFields() {
    isBusinessNameValid.value = businessNameController.text.isNotEmpty;
    isGstValid.value = gstNumberController.text.isNotEmpty &&
        isValidGST(gstNumberController.text);
    isPanValid.value = panNumberController.text.isNotEmpty &&
        isValidPAN(panNumberController.text);
  }

  bool isValidGST(String gst) {
    final regex = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{3}$');
    return regex.hasMatch(gst);
  }

  bool isValidPAN(String pan) {
    final regex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    return regex.hasMatch(pan);
  }

  Future<void> continueRegistration() async {
    // Trim input values
    String gstNumber = gstNumberController.text.trim();
    String panNumber = panNumberController.text.trim();
    String businessName = businessNameController.text.trim();

    // Validate fields before proceeding
    validateFields();

    if (!isBusinessNameValid.value || !isGstValid.value || !isPanValid.value) {
      Get.snackbar("Error", "Please fill all fields correctly.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("auth_token") ?? "";

    try {
      RegProfileReq req = RegProfileReq();
      req.businessName = businessName;
      req.gstNumber = gstNumber;
      req.panNumber = panNumber;
      Repository repo = Repository(token: token);
      var res = await repo.registerProfile(req);

      if (res.status == 201) {
        Get.to(() => CustomBottomNavigationBar());
        Future.delayed(Duration(milliseconds: 200), () {
          showSuccessPopup();
        });
      } else {
        Get.snackbar("Error", "Something went wrong: ${res.message}",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void showSuccessPopup() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Icon(Icons.check_circle, size: 50, color: Color(0xFF00A460)),
            const SizedBox(height: 25),
            const Text(
              "You have registered successfully",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "You can now submit your first project",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0x99000000),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); // Popup close
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF603EA4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }

  // Toggle Checkbox
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}

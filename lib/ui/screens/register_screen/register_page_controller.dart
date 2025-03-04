import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/api_services/api_service.dart';
import 'package:projects/modals/reg_profile_req.dart';
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
    isPanValid.value =
        panNumberController.text.isNotEmpty && isValidPAN(panNumberController.text);
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
        Get.snackbar("Success", "Successfully Registered!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.to(() => HomePageScreen());
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

  void showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 50, color: Color(0xFF00A460)),
              const SizedBox(height: 16),
              const Text(
                "You have registered successfully",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "You can now submit your first project",
                style: TextStyle(fontSize: 14, color: Color(0x99000000),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Get.to(() => HomePageScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Text("Continue", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Toggle Checkbox
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}


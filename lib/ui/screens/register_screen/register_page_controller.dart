import 'package:flutter/cupertino.dart';
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

    // Check if fields are filled
    if (gstNumber.isNotEmpty &&
        panNumber.isNotEmpty &&
        businessName.isNotEmpty) {
      if (!isValidGST(gstNumber)) {
        Get.snackbar("Error", "Invalid GST Number. Please enter a valid GST.",
            snackPosition: SnackPosition.TOP);
        return;
      }
      if (!isValidPAN(panNumber)) {
        Get.snackbar("Error", "Invalid PAN Number. Please enter a valid PAN.",
            snackPosition: SnackPosition.TOP);
        return;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token").toString();

      try {
        RegProfileReq req = RegProfileReq();
        req.businessName = businessName;
        req.gstNumber = gstNumber;
        req.panNumber = panNumber;
        Repository repo = Repository(token: token);
        var res = await repo.registerProfile(req);

        if (res.id != null) {
          Get.snackbar("Success", "Successfully Registered!",
              snackPosition: SnackPosition.TOP);
          Get.to(() => HomePageScreen());
        } else {
          Get.snackbar("Error", "Something went wrong: ",
              snackPosition: SnackPosition.TOP);
        }
      } catch (e) {
        Get.snackbar("Error", "Something went wrong:$e ",
            snackPosition: SnackPosition.TOP);
      }
    } else {
      Get.snackbar("Error", "Please fill all fields correctly.",
          snackPosition: SnackPosition.TOP);
    }
  }

  // Toggle Checkbox
  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}

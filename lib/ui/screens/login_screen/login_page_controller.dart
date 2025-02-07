import 'package:flutter/material.dart';
import '../otp_screen/otp_page_screen.dart';

class LoginPageController extends ChangeNotifier {
  TextEditingController mobileController = TextEditingController();

  // This method can be used to retrieve the entered mobile number
  String getMobileNumber() {
    return mobileController.text;
  }

  // You can add any other methods related to OTP generation here
  void generateOtp(BuildContext context) {
    String mobileNumber = getMobileNumber();
    print("Entered Mobile Number: $mobileNumber");

    // You can navigate to OTP page or do anything here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtpPageScreen()),
    );
  }
}

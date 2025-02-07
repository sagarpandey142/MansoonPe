import 'package:get/get.dart';

class OtpPageController extends GetxController {
  var otp = "".obs;

  void setOtp(String value) {
    otp.value = value;
  }

  void submitOtp() {
    if (otp.value.length == 4) {
      print("OTP Entered: ${otp.value}");
      // Add API logic or navigation after OTP verification
    } else {
      print("Invalid OTP");
    }
  }

  void resendOtp() {
    print("Resending OTP...");
    // Implement OTP resend logic here
  }
}

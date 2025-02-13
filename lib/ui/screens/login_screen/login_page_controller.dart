import 'package:flutter/material.dart';
import 'package:projects/api_services/api_service.dart';
import '../../../modals/modal.dart';
import '../otp_screen/otp_page_screen.dart';

class LoginPageController extends ChangeNotifier {
  TextEditingController mobileController = TextEditingController();

  // This method can be used to retrieve the entered mobile number
  String getMobileNumber() {
    return mobileController.text;
  }

  // You can add any other methods related to OTP generation here
  void generateOtp(BuildContext context) async {
    String mobileNumber = getMobileNumber();
    await getApiRes();
    print("Entered Mobile Number: $mobileNumber");

    // You can navigate to OTP page or do anything here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtpPageScreen()),
    );
  }

  getApiRes()async {
    // Api integrate
    bool isConnected = await InternetService.getInstance().isInternetConnected();
    Repository repository = Repository();
    KnowledgeReq req = KnowledgeReq(loginMobileNo: '989439473947');
    if (isConnected) {
      try {
        final res = await repository.getKnowledgeCenter(req);
        if (res.getKnowledgeCenterAPI?.errorCode == "0") {
          print("API_RES:>> ${res.getKnowledgeCenterAPI!.response!}");

        } else {
          print("API_RES_ERR:>> ${res.getKnowledgeCenterAPI!.response!}");
        }
      } catch (e) {
        print("API_RES_ERR_Exception:>> ${e.toString()}");
      }
    } else {
      print("API_RES_ERR_No_Internet:>>");
    }
    // Api int end


  }
}

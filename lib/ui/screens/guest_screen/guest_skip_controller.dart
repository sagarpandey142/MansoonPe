import 'package:get/get.dart';

class GuestSkipController extends GetxController {
  var creditLeft = 0.obs;
  var userName = "Devesh Gupta";
  var creditLimit = 0.obs;

  void updateCredit(int newCredit) {
    creditLeft.value = newCredit;
  }

  void updateUserName(String newName) {
    userName = newName;
  }

  void updateCreditLimit(int newLimit) {
    creditLimit.value = newLimit;
  }

}

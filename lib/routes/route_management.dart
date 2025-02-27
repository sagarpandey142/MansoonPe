import 'package:get/get.dart';
import 'package:projects/routes/routes.dart';


mixin RouteManagement {


  // bmail routes management functions all available here

  static void goToSplashPageScreen(){
    if(Get.currentRoute != Routes.splashPageScreen){
      Get.toNamed(Routes.splashPageScreen);
    }
  }
  static void goToLoginPageScreen(){
    if(Get.currentRoute != Routes.loginPageScreen){
      Get.toNamed(Routes.loginPageScreen);
    }
  }
  static void goToOtpPageScreen(){
    if(Get.currentRoute != Routes.otpPageScreen){
      Get.offAndToNamed(Routes.otpPageScreen);
    }
  }
  static void goToRegisterPageScreen(){
    if(Get.currentRoute != Routes.registerPageScreen){
      Get.to(Routes.registerPageScreen);
    }
  }
  static void goToGuestSkipScreen(){
    if(Get.currentRoute != Routes.guestSkipScreen){
      Get.toNamed(Routes.guestSkipScreen);
    }
  }
  static void goToHomePageScreen(){
    if(Get.currentRoute != Routes.homePageScreen){
      Get.toNamed(Routes.homePageScreen);
    }
  }
  static void goToProfilePageScreen(){
    if(Get.currentRoute != Routes.profilePageScreen){
      Get.offAndToNamed(Routes.profilePageScreen);
    }
  }
// b connect routes management function all available here

}
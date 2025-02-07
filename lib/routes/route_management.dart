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
      Get.toNamed(Routes.registerPageScreen);
    }
  }
  static void goToHomePageScreen(){
    if(Get.currentRoute != Routes.homePageScreen){
      Get.toNamed(Routes.homePageScreen);
    }
  }
// b connect routes management function all available here

}
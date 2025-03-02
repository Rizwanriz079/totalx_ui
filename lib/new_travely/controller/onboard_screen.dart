import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:totalx_ui/new_travely/login_screen.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController();

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Get.off(LoginScreen());
    }
  }
}
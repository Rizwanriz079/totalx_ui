import 'dart:async';
import 'package:get/get.dart';

class OTPController extends GetxController {
  var otpCode = List<String>.filled(4, "").obs;
  var isVerifying = false.obs;
  var timeLeft = 90.obs;

  void setOtpValue(int index, String value) {
    otpCode[index] = value;
    update();
  }

  String getOtp() {
    return otpCode.join();
  }

  void startTimer() {
    timeLeft.value = 90;
    Timer.periodic(const Duration(seconds: 1), (timer) { // ✅ Use Timer.periodic
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void verifyOtp() {
    isVerifying.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isVerifying.value = false;
      if (getOtp() == "8695") {
        Get.snackbar("Success", "OTP Verified Successfully!");
        Get.offAllNamed("/home"); // Navigate to home after success
      } else {
        Get.snackbar("Error", "Invalid OTP. Please try again.");
      }
    });
  }
}

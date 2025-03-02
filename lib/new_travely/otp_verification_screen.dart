import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/constant.dart';
import 'controller/otp_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  final OTPController otpController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    otpController.startTimer(); // Start countdown on screen load

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text("OTP Verification",
                      style: AppTextStyle.satoshi(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  const SizedBox(height: 8),
                  Text(
                    "Please check your email www.uihut@gmail.com to see the verification code",
                    style: AppTextStyle.satoshi(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "OTP Code",
              style: AppTextStyle.satoshi(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[
                        200], // ✅ Light background color like in the image
                    borderRadius:
                        BorderRadius.circular(12), // ✅ Rounded corners
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.satoshi(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none, // ✅ Remove default borders
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                      otpController.setOtpValue(index, value);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0D6EFD),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: otpController.isVerifying.value
                    ? null
                    : otpController.verifyOtp,
                child: otpController.isVerifying.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Verify",
                        style: AppTextStyle.satoshi(
                            fontSize: 18, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Resend code to",
                    style: AppTextStyle.satoshi(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  Text(
                    "00:${otpController.timeLeft.value.toString().padLeft(2, '0')}",
                    style: AppTextStyle.satoshi(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totalx_ui/new_travely/constant/constant.dart';

import 'otp_verification_screen.dart';

void showEmailSentDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mark_email_read, size: 60, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              "Check your email",
              style: AppTextStyle.satoshi(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              "We have sent password recovery instructions to your email",
              style: AppTextStyle.satoshi(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0D6EFD),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => Get.to(OTPVerificationScreen()),
              child: Text(
                "OK",
                style: AppTextStyle.satoshi(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

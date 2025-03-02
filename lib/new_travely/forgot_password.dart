import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constant/constant.dart';
import 'controller/forgot_password_controller.dart';
import 'forgot_password_pop_up.dart';



class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 30),
              onPressed: () => Get.back(),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    "Forgot password",
                    style: AppTextStyle.satoshi(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Enter your email account to reset your password",
                    style: AppTextStyle.satoshi(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: "www.uihut@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D6EFD),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Simulate API call for password reset
                      Future.delayed(const Duration(seconds: 1), () {
                        showEmailSentDialog(); // Show the popup
                      });
                    },
                    child: Text(
                      "Reset Password",
                      style: AppTextStyle.satoshi(fontSize: 18, color: Colors.white),
                    ),
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

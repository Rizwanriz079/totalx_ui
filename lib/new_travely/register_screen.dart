import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totalx_ui/new_travely/login_screen.dart';
import 'constant/constant.dart';
import 'controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              IconButton(
                icon: Icon(Icons.arrow_back, size: 30),
                onPressed: () => Get.off(LoginScreen()),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Sign up now",
                      style: AppTextStyle.satoshi(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Please fill the details and create account",
                      style: AppTextStyle.satoshi(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: 16),
                    Obx(
                          () => TextField(
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password must be 8 characters",
                        style: AppTextStyle.satoshi(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0D6EFD),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Sign Up", style: AppTextStyle.satoshi(fontSize: 18, color: Colors.white)),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?", style: AppTextStyle.satoshi(fontSize: 14,color: Colors.grey)),
                        TextButton(
                          onPressed: () => Get.offAllNamed('/login'),
                          child: Text(
                            "Sign in",
                            style: AppTextStyle.satoshi(fontSize: 14, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Text("Or connect", style: AppTextStyle.satoshi(fontSize: 14,color: Colors.grey)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.network('https://th.bing.com/th/id/OIP.tkUWV6h-KefH5AGFoSqtMgHaHa?rs=1&pid=ImgDetMain', width: 40, height: 40),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.network('https://s3-alpha.figma.com/hub/file/2729744958/2a5758d6-4edb-4047-87bb-e6b94dbbbab0-cover.png', width: 40, height: 40),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.network('https://th.bing.com/th/id/OIP.2spOcwGpwKFSn-ZDDhdeIgHaHd?rs=1&pid=ImgDetMain', width: 40, height: 40),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

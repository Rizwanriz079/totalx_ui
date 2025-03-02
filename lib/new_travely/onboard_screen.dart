import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'constant/constant.dart';
import 'controller/onboard_screen.dart';


class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/onboard(3).png",
      "title": "Life is short and the world is wide",
      "description": "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world"
    },
    {
      "image": "assets/onboard(2).png",
      "title": "It's a big world out there go explore",
      "description": "To get the best of your adventure you just need to leave and go where you like. we are waiting for you."
    },
    {
      "image": "assets/onboard(1).png",
      "title": "People don't take trips, trips take people",
      "description": "To get the best of your adventure you just need to leave and go where you like. we are waiting for you."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) => controller.currentIndex.value = index,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(onboardingData[index]["image"]!),
                    SizedBox(height: 20),
                    Text(
                      onboardingData[index]["title"]!,
                      style: AppTextStyle.satoshi(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.satoshi(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
                  (index) => Container(
                margin: EdgeInsets.all(4),
                width: controller.currentIndex.value == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: controller.currentIndex.value == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.all(20),
            child: Obx(() => ElevatedButton(
              onPressed: controller.nextPage,
              child: Text(
                controller.currentIndex.value == onboardingData.length - 1 ? "Get Started" : "Next",
                style: AppTextStyle.satoshi(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0D6EFD),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            )),
          )
        ],
      ),
    );
  }
}
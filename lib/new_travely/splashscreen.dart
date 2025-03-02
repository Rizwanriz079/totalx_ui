import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:totalx_ui/new_travely/controller/splash_controller.dart';

import 'constant/constant.dart';


class Splashscreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D6EFD),
      body: Center(
        child: Text(
          "Travely",
          style: AppTextStyle.satoshi(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}



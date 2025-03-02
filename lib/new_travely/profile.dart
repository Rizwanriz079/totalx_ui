import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/constant.dart';

class ProfileController extends GetxController {
  var rewardPoints = 360.obs;
  var travelTrips = 238.obs;
  var bucketList = 473.obs;
}

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyle.satoshi(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/Profile.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Leonardo',
              style: AppTextStyle.satoshi(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              'leonardo@gmail.com',
              style: AppTextStyle.satoshi(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profileStat('Reward Points', controller.rewardPoints),
                profileStat('Travel Trips', controller.travelTrips),
                profileStat('Bucket List', controller.bucketList),
              ],
            ),
            SizedBox(height: 20),
            profileMenuItem(Icons.person, 'Profile'),
            profileMenuItem(Icons.bookmark, 'Bookmarked'),
            profileMenuItem(Icons.history, 'Previous Trips'),
            profileMenuItem(Icons.settings, 'Settings'),
            profileMenuItem(Icons.info, 'Version'),
          ],
        ),
      ),
    );
  }

  Widget profileStat(String title, RxInt value) {
    return Expanded(
      child: Column(
        children: [
          Obx(() => Text(
            '${value.value}',
            style: AppTextStyle.satoshi(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          )),
          Text(
            title,
            style: AppTextStyle.satoshi(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget profileMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: AppTextStyle.satoshi(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
      onTap: () {},
    );
  }
}


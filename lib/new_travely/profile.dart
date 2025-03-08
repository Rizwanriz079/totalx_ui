import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constant/constant.dart';
import 'controller/profile_controller.dart';


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
            onPressed: () {
              Get.to(() => EditProfileScreen());
            },
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
            Obx(() => Text(
              controller.firstName.value,
              style: AppTextStyle.satoshi(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            )),
            Obx(() => Text(
              controller.lastName.value,
              style: AppTextStyle.satoshi(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
            )),
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

class EditProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.find();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstNameController.text = controller.firstName.value;
    lastNameController.text = controller.lastName.value;
    locationController.text = controller.location.value;
    mobileNumberController.text = controller.mobileNumber.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: AppTextStyle.satoshi(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.firstName.value = firstNameController.text;
              controller.lastName.value = lastNameController.text;
              controller.location.value = locationController.text;
              controller.mobileNumber.value = mobileNumberController.text;
              Get.back();
            },
            child: Text('Done', style: TextStyle(color: Colors.blue)),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/Profile.jpg'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('Change Profile Picture', style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 20),
            buildTextField('First Name', firstNameController),
            buildTextField('Last Name', lastNameController),
            buildTextField('Location', locationController),
            buildTextField('Mobile Number', mobileNumberController),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyle.satoshi(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

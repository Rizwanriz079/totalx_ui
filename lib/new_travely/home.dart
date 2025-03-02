import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:totalx_ui/new_travely/message.dart';
import 'package:totalx_ui/new_travely/profile.dart';
import 'package:totalx_ui/new_travely/search.dart';
import 'calender.dart';
import 'detail_screen.dart';


class HomeController extends GetxController {
  var destinations = [
    {
      'image': 'assets/c.png',
      'title': 'Niladri Reservoir',
      'location': 'Tekergat, Sunamgnj',
      'rating': 4.7,
      'price': '\$59/Person'
    },
    {
      'image': 'assets/c.png',
      'title': 'Darma Hill',
      'location': 'Darma, India',
      'rating': 4.5,
      'price': '\$49/Person'
    }
  ].obs;

  var currentIndex = 0.obs;
  void changeTab(int index) {
    if (index == 1) {
      Get.to(() => CalendarScreen());
    } else if (index == 2) {
      Get.to(() => SearchScreen());
    } else if (index == 3) {
      Get.to(() => MessagesScreen());
    } else if (index == 4) {
      Get.to(() => ProfileScreen());
    } else {
      currentIndex.value = index;
    }
  }
}

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search for places",
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.notifications, color: Colors.grey), onPressed: () {}),
                IconButton(icon: Icon(Icons.filter_list, color: Colors.grey), onPressed: () {}),
              ],
            ),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore the Beautiful", style: TextStyle(fontSize: 24)),
            Text("world!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Best Destination", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.destinations.length,
                itemBuilder: (context, index) {
                  var destination = homeController.destinations[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailScreen(destination: destination), transition: Transition.fadeIn);
                    },
                    child: _buildDestinationCard(destination),
                  );
                },
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.calendar_today, size: 30),
          Icon(Icons.search, size: 30, color: Colors.blue),
          Icon(Icons.message, size: 30),
          Icon(Icons.person, size: 30),
        ],
        index: homeController.currentIndex.value,
        onTap: (index) => homeController.changeTab(index),
      )),
    );
  }

  Widget _buildDestinationCard(Map<String, dynamic> destination) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(destination['image'], height: 140, width: 200, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destination['title'], style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                    Text(destination['location'], style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

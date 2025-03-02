import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'calender.dart';
import 'constant/constant.dart';
import 'controller/calendar_controller.dart';

class DetailController extends GetxController {
  final RxBool isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic>? destination;
  final DetailController controller = Get.put(DetailController());
  final CalendarController calendarController = Get.put(CalendarController());

  DetailScreen({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (destination == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text("Invalid destination data", style: AppTextStyle.satoshi(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.network(
            destination!['image'] ?? '',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(Icons.arrow_back, () => Get.back()),
                Row(
                  children: [
                    Obx(() => _buildIconButton(
                      controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                      controller.toggleFavorite,
                    )),
                    SizedBox(width: 10),
                    _buildIconButton(Icons.share, _shareDestination),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  if (destination!['photos'] != null && destination!['photos'] is List)
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              destination!['photos'][index % destination!['photos'].length],
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 10),
                  Text(
                    destination!['title'] ?? 'Unknown',
                    style: AppTextStyle.satoshi(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    destination!['location'] ?? 'Unknown',
                    style: AppTextStyle.satoshi(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      SizedBox(width: 5),
                      Text(destination!['location'] ?? 'Unknown', style: AppTextStyle.satoshi(color: Colors.grey)),
                      SizedBox(width: 20),
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 5),
                      Text('${destination!['rating'] ?? '0'} (2498)', style: AppTextStyle.satoshi(color: Colors.grey)),
                      Spacer(),
                      Text(destination!['price'] ?? '', style: AppTextStyle.satoshi(color: Colors.yellow, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("About Destination", style: AppTextStyle.satoshi(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 5),
                  Text(
                    "${destination!['description'] ?? 'No description available.'}",
                    style: AppTextStyle.satoshi(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (destination != null) {
                          String name = destination!['title'] ?? 'Unknown';
                          String location = destination!['location'] ?? 'Unknown';
                          String imageUrl = destination!['image'] ?? '';

                          calendarController.bookDate(calendarController.selectedDate.value, name, location, imageUrl);
                          Get.back();
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18),
                      ),
                      child: Text("Book Now", style: AppTextStyle.satoshi(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.3),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  void _shareDestination() {
    if (destination != null) {
      String shareText = "Check out this destination: ${destination!['title']} in ${destination!['location']}. Price: ${destination!['price']}.";
      Share.share(shareText);
    }
  }
}


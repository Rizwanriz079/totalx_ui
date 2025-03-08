



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/constant.dart';
import 'controller/fav_controller.dart';



class FavoritePlacesScreen extends StatelessWidget {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Places', style: AppTextStyle.satoshi(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() => controller.favoritePlaces.isEmpty
          ? Center(child: Text("No favorite places yet", style: AppTextStyle.satoshi(fontSize: 16, color: Colors.grey)))
          : GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemCount: controller.favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = controller.favoritePlaces[index];
          return FavoritePlaceCard(place: place, controller: controller);
        },
      )),
    );
  }
}

class FavoritePlaceCard extends StatelessWidget {
  final Map<String, String> place;
  final FavoriteController controller;

  FavoritePlaceCard({required this.place, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(place['image']!, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place['name']!, style: AppTextStyle.satoshi(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                Text(place['location']!, style: AppTextStyle.satoshi(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.bookmark, color: Colors.red),
            onPressed: () => controller.toggleFavorite(place),
          ),
        ],
      ),
    );
  }
}



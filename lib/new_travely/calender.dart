import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/constant.dart';
import 'controller/calendar_controller.dart';



class CalendarScreen extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Schedule', style: AppTextStyle.satoshi(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 10),
            Obx(() => CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              onDateChanged: (date) => controller.selectedDate.value = date,
              selectableDayPredicate: (date) => true,
            )),
            SizedBox(height: 20),
            Text('My Schedule', style: AppTextStyle.satoshi(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.bookingHistory.length,
                itemBuilder: (context, index) {
                  final booking = controller.bookingHistory[index];
                  return ListTile(
                    leading: Image.network(booking['imageUrl'], width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(booking['name'], style: AppTextStyle.satoshi(fontSize: 16, color: Colors.black)),
                    subtitle: Text('${booking['location']}\n${booking['date'].toString().split(' ')[0]}',
                        style: AppTextStyle.satoshi(fontSize: 14, color: Colors.grey)),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

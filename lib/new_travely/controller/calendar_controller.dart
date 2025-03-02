// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class CalendarController extends GetxController {
//   var selectedDate = DateTime.now().obs;
//   var bookedDates = <DateTime>[].obs;
//
//   void setDate(DateTime date) {
//     selectedDate.value = date;
//   }
//
//   void bookDate() {
//     if (!bookedDates.contains(selectedDate.value)) {
//       bookedDates.add(selectedDate.value);
//     }
//   }
//
//   String get formattedDate => DateFormat('dd MMMM yyyy').format(selectedDate.value);
// }

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CalendarController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxList<DateTime> bookedDates = <DateTime>[].obs;
  RxList<Map<String, dynamic>> bookingHistory = <Map<String, dynamic>>[].obs;

  void bookDate(DateTime date, String name, String location, String imageUrl) {
    bookedDates.add(date);
    bookingHistory.add({
      'date': date,
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
    });
  }
}
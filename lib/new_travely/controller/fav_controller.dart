import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavoriteController extends GetxController {
  var favoritePlaces = <Map<String, String>>[].obs;

  void toggleFavorite(Map<String, String> place) {
    if (favoritePlaces.contains(place)) {
      favoritePlaces.remove(place);
    } else {
      favoritePlaces.add(place);
    }
  }
}
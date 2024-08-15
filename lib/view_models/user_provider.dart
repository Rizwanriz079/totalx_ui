import 'package:flutter/cupertino.dart';
import 'package:totalx_ui/models/models.dart';


class UserProvider with ChangeNotifier {
  List<UserModel> _users = [
    UserModel(name: "Martin Dokidis", age: 34, imageUrl: "https://via.placeholder.com/150"),
    UserModel(name: "Marilyn Rosser", age: 44, imageUrl: "https://via.placeholder.com/150"),
    UserModel(name: "Cristofer Lipshutz", age: 34, imageUrl: "https://via.placeholder.com/150"),
    UserModel(name: "Wilson Botosh", age: 24, imageUrl: "https://via.placeholder.com/150"),
    UserModel(name: "Anika Saris", age: 55, imageUrl: "https://via.placeholder.com/150"),
    UserModel(name: "Phillip Gouse", age: 44, imageUrl: "https://via.placeholder.com/150"),
    UserModel(name: "Wilson Bergson", age: 34, imageUrl: "https://via.placeholder.com/150"),
  ];

  String _searchQuery = '';
  String _filter = 'All';
  String get filter => _filter;
  List<UserModel> get users {
    List<UserModel> filteredUsers = _users.where((user) {
      if (_filter == 'Elder' && user.age < 35) return false;
      if (_filter == 'Younger' && user.age >= 35) return false;
      return user.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    return filteredUsers;
  }

  void addUser(UserModel user) {
    _users.add(user);
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
}

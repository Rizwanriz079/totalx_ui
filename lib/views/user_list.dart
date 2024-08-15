import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/user_provider.dart';
import 'Add_user.dart';


class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: 5,),
            Text(
              "Nilambur",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          userProvider.setSearchQuery(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: "Search by name",
                          filled: true,
                          fillColor: Colors.grey[100],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Container(
                      color: Colors.black,
                      child: IconButton(
                        icon: Icon(Icons.filter_list, color: Colors.white),
                        onPressed: () {
                          _showFilterDialog(context, userProvider);
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Users Lists",style: TextStyle(
                      fontWeight: FontWeight.w500,fontSize: 15
                  ),),
                ),
                // Users List
                Expanded(
                  child: ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = userProvider.users[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: _getImageProvider(user.imageUrl),
                            backgroundColor: Colors.grey[200],
                            child: user.imageUrl.isEmpty
                                ? Icon(Icons.person, size: 30, color: Colors.blue)
                                : null,
                          ),
                          title: Text(user.name),
                          subtitle: Text('Age: ${user.age}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddUserScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }

  void _showFilterDialog(BuildContext context, UserProvider userProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Container(
            width: 300,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sort",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                RadioListTile<String>(
                  title: Text(
                    "All",
                    style: TextStyle(color: Colors.black),
                  ),
                  value: 'All',
                  groupValue: userProvider.filter,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    userProvider.setFilter(value!);
                    Navigator.of(context).pop();
                  },),
                RadioListTile<String>(
                  title: Text(
                    "Age: Elder",
                    style: TextStyle(color: Colors.black),
                  ),
                  value: 'Elder',
                  groupValue: userProvider.filter,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    userProvider.setFilter(value!);
                    Navigator.of(context).pop();
                  },),
                RadioListTile<String>(
                  title: Text(
                    "Age: Younger",
                    style: TextStyle(color: Colors.black),
                  ),
                  value: 'Younger',
                  groupValue: userProvider.filter,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    userProvider.setFilter(value!);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return NetworkImage(imageUrl);
    } else {
      return FileImage(File(imageUrl));
    }
  }
}
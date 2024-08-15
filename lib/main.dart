import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_ui/view_models/auth_provider.dart';
import 'package:totalx_ui/view_models/user_provider.dart';
import 'package:totalx_ui/views/phone_number.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PhoneNumber(),
      ),
    );
  }
}

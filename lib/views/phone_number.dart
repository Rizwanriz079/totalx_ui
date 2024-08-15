import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_ui/views/otp.dart';
import '../view_models/auth_provider.dart';


class PhoneNumber extends StatelessWidget {
  PhoneNumber({super.key});

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Center(child: Image.asset('assets/a.png')),
              SizedBox(height: 90),
              Text(
                "Enter Phone Number",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "By continuing, I agree to TotalX's ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: ' & ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Terms and Policy',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    if (_phoneController.text.length == 10) {
                      authProvider.setPhoneNumber(_phoneController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid 10-digit phone number')),
                      );
                    }
                  },
                  child: Text('Get OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

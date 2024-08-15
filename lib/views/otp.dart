import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_ui/views/user_list.dart';
import '../view_models/auth_provider.dart';
import 'dart:async';



class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  late Timer _timer;
  int _seconds = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var node in _focusNodes) node.dispose();
    for (var controller in _otpControllers) controller.dispose();
    super.dispose();
  }

  String get otpCode {
    return _otpControllers.map((controller) => controller.text).join();
  }

  void _clearOtp() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
  }

  Future<bool> _onWillPop() async {
    _clearOtp();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    String maskedPhoneNumber;

    if (authProvider.phoneNumber.length >= 10) {
      maskedPhoneNumber = '${authProvider.phoneNumber.substring(0, 2)}******${authProvider.phoneNumber.substring(8)}';
    } else {
      maskedPhoneNumber = authProvider.phoneNumber;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/b.png'),
                  SizedBox(height: 20),
                  Text(
                    'OTP Verification',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter the verification code we just sent to your \nnumber: $maskedPhoneNumber',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 50,
                        height: 50,
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _focusNodes[index],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            counterText: '',
                          ),
                          style: TextStyle(color: Colors.red, fontSize: 20),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              if (index < 5) {
                                _focusNodes[index + 1].requestFocus();
                              }
                            } else if (index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$_seconds seconds',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't Get OTP?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    ),
                    onPressed: () {
                      authProvider.setOtpCode(otpCode);

                      if (authProvider.otpCode == '123456') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserListScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid OTP')),
                        );
                      }
                    },
                    child: Text('Verify'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

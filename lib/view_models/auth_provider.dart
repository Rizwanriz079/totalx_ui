import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier{
  String _phoneNumber = "";
  String _otpCode = "";

  String get phoneNumber => _phoneNumber;
  String get otpCode => _otpCode;

  void setPhoneNumber(String phoneNumber){
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setOtpCode(String otpCode){
    _otpCode = otpCode;
    notifyListeners();
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle satoshi({double fontSize = 24, FontWeight fontWeight = FontWeight.bold, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

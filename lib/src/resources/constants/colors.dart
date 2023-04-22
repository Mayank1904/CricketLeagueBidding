import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color blueColor = Color(0xFF2F39C5);
  static const Color yellow = Color(0xfffff100);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color whiteGrey = Color(0xffebebeb);
  static const Color green = Color(0xff1fb30a);
  static const Color red = Color(0xffff0000);
  static const Color brownishGrey = Color(0xff666666);
  static const Color warmGrey = Color(0xff9f9f9f);
  static const Color darkGreen = Color(0xff1b5f52);

  static const Color backgroundColor = Color(0xff17001d);
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );
}


import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor =  Color(0xFF6B6B6B);
  static const opacity = Color(0xFF15AB89);
  static const darkPrimary =  Color(0xFF726F6F);
  static const secondary =  Color(0xFF3B3B3B);
  static const txtHint =  Color(0xFFA9A9A9);
  static const txtTitle =  Color(0xFF622381);
  static const txtBlack =  Color(0xFF171717);
  static const purple =  Color(0xFF500A73);
  static const witheTheme =  Color(0xFFF9F9F9);
  static const txtTitleAccount =  Color(0xFF828282);
  static const border =  Color(0xFFDCDADA);
  static const txtAddress =  Color(0xFF030B78);
  static const colorApp =  Color(0xFF2AD9DC);
  static const colorTexFiled =  Color(0xFFFAFAFA);
  static const colorDoc =  Color(0xFFFF981E);
  static const colorGallery =  Color(0xFF9D28AC);
  static const colorMicro =  Color(0xFF4AAF57);

  static LinearGradient createSecondaryGradient(){
    return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          secondary,
           Color(0xFFD9D9D9)
        ]
    );
  }
}
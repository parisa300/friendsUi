import 'package:flutter/material.dart';
import 'package:friends/screen/home_screen.dart';
import 'package:friends/screen/login_screen.dart';
import 'package:friends/screen/profile_user_screen.dart';
import 'package:friends/screen/slider_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme:ThemeData(appBarTheme: AppBarTheme(color: Colors.white))
    );
  }
}


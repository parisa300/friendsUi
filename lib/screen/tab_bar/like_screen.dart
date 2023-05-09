import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/tab_bar/favorite_screen.dart';
import 'package:friends/screen/tab_bar/likes_screen.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({Key? key}) : super(key: key);

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Actions',style: TextStyle(color: Colors.black),),

          bottom: const TabBar(
            labelColor: Colors.blue, //<-- selected text color
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab( text: "Favorites",),
              Tab( text: "Likes")
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FavoriteScreen(),
            LikesScreen(),
          ],
        ),
      ),
    );

  }
}

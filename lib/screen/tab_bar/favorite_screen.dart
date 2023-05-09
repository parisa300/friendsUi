import 'package:flutter/material.dart';
import 'package:friends/screen/tab_bar/item/item_screen_favorite.dart';
import 'package:friends/screen/tab_bar/model/model_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       List_favorite()
     ],

   );
  }

  Widget List_favorite(){

      var list = ActionProvider().getDepositList();
      return ListView.separated(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ItemScreenFavorite(item: list[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
      );
    }
  }


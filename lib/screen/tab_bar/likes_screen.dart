import 'package:flutter/material.dart';
import 'package:friends/screen/tab_bar/item/item_screen_like.dart';
import 'package:friends/screen/tab_bar/model/model_likes.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        List_likes()
      ],

    );
  }

  Widget List_likes(){


    var list = ActionProviderLike().getDepositList();
    return ListView.separated(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ItemScreenLike(item: list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 16);
      },
    );
  }
}


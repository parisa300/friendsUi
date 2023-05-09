
import 'package:flutter/material.dart';
import 'package:friends/screen/item_model_best_pic.dart';


class ListHorizontalScreen extends StatelessWidget {
  const ListHorizontalScreen({Key? key, required this.item}) : super(key: key);
  final ItemModelBestPic item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),

      ),
      child: Image.asset(item.image,fit: BoxFit.cover,),
    );
  }
}

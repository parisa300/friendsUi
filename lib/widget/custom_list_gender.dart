
import 'package:flutter/material.dart';
import 'package:friends/screen/model_item_gender.dart';
class CustomListGender extends StatelessWidget {
   CustomListGender( {required this.item}) ;
  final  ModelItemGender item;

   @override
  Widget build(BuildContext context) {
    return InkWell(

          child: Text(
            item.title,
            style: const TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600),
          ),

        );

  }
}


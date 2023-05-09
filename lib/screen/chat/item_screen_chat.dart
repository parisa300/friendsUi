import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/chat/model_chat.dart';
import 'package:friends/screen/tab_bar/model/model_favorite.dart';


class ItemScreenChat extends StatelessWidget {
  const ItemScreenChat({Key? key, required this.item}) : super(key: key);
  final ModelChat item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(padding:const EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.grey[300],

          borderRadius:  const BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(item.image),

                Expanded(
                  flex: 2,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(item.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(item.desc,style: const TextStyle(fontSize: 12),),
                    ),
                  ],),
                ),

               Column(
                 children: [
                   Container(width: 20,height: 20,decoration:  const BoxDecoration(color: AppColors.colorApp,
                       borderRadius:  BorderRadius.all(Radius.circular(36))),
                   child: Text(textAlign:TextAlign.center,item.badge,style: const TextStyle(color: Colors.white,),),),

                   Text(item.time),
                 ],
               )

              ],
            ),
          ),




        ]
        ),
      ),
    );
  }
}
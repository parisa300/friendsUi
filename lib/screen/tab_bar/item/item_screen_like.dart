
import 'package:flutter/material.dart';
import 'package:friends/screen/tab_bar/model/model_likes.dart';


class ItemScreenLike extends StatelessWidget {
  const ItemScreenLike({Key? key, required this.item}) : super(key: key);
  final ModelLikes item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(padding:EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.grey[300],

              borderRadius:  BorderRadius.all(Radius.circular(16))),
            child: Row(
              children: [
                Image.asset(item.image),

                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(item.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(item.desc,style: const TextStyle(fontSize: 12),),
                      ),
                    ],),
                ),

                Image.asset(item.icon)

              ],
            ),
          ),




        ]
        ),
      ),
    );
  }
}
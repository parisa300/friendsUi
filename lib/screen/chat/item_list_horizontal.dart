import 'package:flutter/material.dart';
import 'package:friends/screen/chat/model_list_top.dart';
class ItemListHorizontal extends StatelessWidget {
  const ItemListHorizontal({Key? key,required this.item}) : super(key: key);
  final ModelListTop item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Image.asset(item.image),
            const SizedBox(height: 8),
            Text(item.title)
          ],
        ),
      ),
    );
  }
}

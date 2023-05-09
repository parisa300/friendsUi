import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/chat/chat_page_view.dart';
import 'package:friends/screen/chat/item_list_horizontal.dart';
import 'package:friends/screen/chat/item_screen_chat.dart';
import 'package:friends/screen/chat/model_chat.dart';
import 'package:friends/screen/chat/model_list_top.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null, actions: <Widget>[
        IconButton(icon: const Icon(Icons.camera_alt_outlined,color: Colors.black,), onPressed: () {}),
        IconButton(icon: const Icon(Icons.edit_calendar_outlined,color: Colors.black,), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search,color: Colors.black,), onPressed: () {}),
      ],
        title: const Text('chats',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            title(),
            SizedBox(  height: MediaQuery.of(context).size.height/8,child: List_top()),
            List_bottom(),
          ],
        ),
      ),
    );
  }


  Widget title(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('New Active',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
          Text('see All',style: TextStyle(color:AppColors.colorApp,fontWeight: FontWeight.bold,fontSize: 14),),


        ],
      ),
    );
  }

  Widget List_top(){
    var list = ModelListProvider().getDepositList();
    return ListView.separated(
      itemCount: list.length,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return ItemListHorizontal(item: list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 8);
      },
    );
  }

  Widget List_bottom(){

    var list = ActionProvider().getDepositList();
    return ListView.separated(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const ChatPageView();
            },
          ));

        },child: ItemScreenChat(item: list[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 12);
      },
    );
  }
}

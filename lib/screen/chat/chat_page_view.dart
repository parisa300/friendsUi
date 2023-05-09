import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/chat/chat_screen_call.dart';
import 'package:friends/widget/Resived_message_widget.dart';
import 'package:friends/widget/send_message_widget.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../model/mesagge.dart';
import '../../provider/home_provider.dart';
class ChatPageView extends StatefulWidget {
  // final String username;

  const ChatPageView({
    Key? key,
    //   required this.username,
  }) : super(key: key);

  @override
  _ChatPageViewState createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  late IO.Socket _socket;
   bool attach=false;





  _sendMessage() {
    _socket.emit('message', {
      'message': _text.text.trim(),
      'sender': 'nik'
    });
    _text.clear();
  }

  _connectSocket() {
    _socket.onConnect((data) => print('Connection established'));
    _socket.onConnectError((data) => print('Connect Error: $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    _socket.on(
      'message',
          (data) => Provider.of<HomeProvider>(context, listen: false).addNewMessage(
            Mesagge.fromJson(data),
      ),
    );
  }



  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }


  var childList = <Widget>[];
  void showToast() {
    setState(() {
      attach = !attach;
    });
  }
  @override
  void initState() {
   // connect();
    super.initState();
    childList.add(Align(
        alignment: Alignment(0, 0),
        child: Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 25,
          width: 50,
          decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              )),
          child: const Center(
              child: Text(
            "Today",
            style: TextStyle(fontSize: 11),
          )),
        )));
    childList.add(const Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Hello',
        time: '21:36 PM',
        isImage: false,
      ),
    ));
    childList.add(const Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'How are you? What are you doing?',
        time: '21:36 PM',
        isImage: false,
      ),
    ));
    childList.add(const Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Hello, Mohammad.I am fine. How are you?',
        time: '22:40 PM',
        isImage: false,
      ),
    ));
    childList.add(const Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content:
            'I am good. Can you do something for me? I need your help my bro.',
        time: '22:40 PM',
        isImage: false,
      ),
    ));

    //Important: If your server is running on localhost and you are testing your app on Android then replace http://localhost:3000 with http://10.0.2.2:3000
    _socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {'username': 'nik'}).build(),
    );
    _connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:Icon(Icons.arrow_back,color: Colors.black) , actions: <Widget>[
        IconButton(icon:  Image.asset('assets/image/dotdot.png'), onPressed: () {}),
        IconButton(icon:  Image.asset('assets/image/call.png'), onPressed: () {}),
        IconButton(icon:  Image.asset('assets/image/video.png'), onPressed: () {

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const ChatScreenCall();
            },
          ));
        }),
      ],
        title: const Text('Natasha',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  const Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: SingleChildScrollView(
                          controller: _scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: childList,
                          )),
                    ),
                  ),
                  _attach(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(8)),
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: 50,
                          child: TextField(
                            maxLines: 20,
                            controller: _text,
                            decoration: InputDecoration(
                              prefixIcon: GestureDetector(onTap:(){

                                if (_text.text.trim().isNotEmpty) {
                                  _sendMessage();
                                }
                               } ,child:Image.asset('assets/image/sticker.png')),
                              suffixIcon: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child:
                                        GestureDetector(
                                            onTap: showToast,
                                            child: Image.asset('assets/image/attach.png')),
                                  ),
                                  SizedBox(width: 8),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 16.0),
                                    child:
                                       Padding(
                                         padding: EdgeInsets.only(right: 8.0),
                                         child: Icon(Icons.camera_alt_outlined),
                                       ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                              hintText: "Type a Message .....",
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                                color: AppColors.colorApp,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(36))),child: Image.asset('assets/image/voice.png'),),
                      ],
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _attach(){
    return Visibility(
      visible: attach,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width/1.5,
            decoration: BoxDecoration(border: Border.all(width: 1,color: AppColors.border),borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                        color: AppColors.colorDoc,
                        borderRadius:
                        BorderRadius.all(Radius.circular(36))),child:
                            Image.asset('assets/image/doc.png'),
                        
                        ),
                  
                  const Text('Document',style: TextStyle(color: AppColors.txtHint),)
                ],
              ),

              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                        color: AppColors.colorGallery,
                        borderRadius:
                        BorderRadius.all(Radius.circular(36))),child: Image.asset('assets/image/gallery.png'),),
                  
                  const Text('Gallery',style: TextStyle(color: AppColors.txtHint))
                ],
              ),

              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                        color: AppColors.colorMicro,
                        borderRadius:
                        BorderRadius.all(Radius.circular(36))),child: Image.asset('assets/image/microphone.png'),),

                  const Text('Audio',style: TextStyle(color: AppColors.txtHint))
                ],
              ),

            ],),
          ),
        ],
      ),
    );
  }
}

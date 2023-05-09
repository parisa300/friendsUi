
import 'package:flutter/material.dart';
import 'package:friends/model/message.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/widget/custom_button.dart';
import 'package:friends/widget/custom_button_live.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {

  final _infoStrings = <Message>[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            profile_top(),
        //    messageList(),
          ],
        ),
      ),
    );
  }


  Widget profile_top(){
    return Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36.0, left: 16),
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://googleflutter.com/sample_image.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('parisa',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            const SizedBox(height: 16),
            Text('developer',style: TextStyle(color: Colors.grey[200]),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CustomButtonLive(title: 'follow', onPressed: (){},color: AppColors.colorApp,),
              const SizedBox(width: 8),
              CustomButtonLive(title: '3.6 k', onPressed: (){},color: AppColors.primaryColor,)
            ],
          ),
        )
      ],
    );
  }


  // /// Info panel to show logs
  // Widget messageList() {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
  //     alignment: Alignment.bottomCenter,
  //     child: FractionallySizedBox(
  //       heightFactor: 0.5,
  //       child: Container(
  //         padding: const EdgeInsets.symmetric(vertical: 48),
  //         child: ListView.builder(
  //           reverse: true,
  //           itemCount: _infoStrings.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             if (_infoStrings.isEmpty) {
  //
  //             }
  //             return Padding(
  //               padding: const EdgeInsets.symmetric(
  //                 vertical: 3,
  //                 horizontal: 10,
  //               ),
  //               child: (_infoStrings[index].type=='join')? Padding(
  //                 padding: const EdgeInsets.only(bottom: 10),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     CachedNetworkImage(
  //                       imageUrl: _infoStrings[index].image,
  //                       imageBuilder: (context, imageProvider) => Container(
  //                         width: 32.0,
  //                         height: 32.0,
  //                         decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           image: DecorationImage(
  //                               image: imageProvider, fit: BoxFit.cover),
  //                         ),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const  EdgeInsets.symmetric(
  //                         horizontal: 8,
  //                       ),
  //                       child: Text(
  //                         '${_infoStrings[index].user} joined',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //                   : (_infoStrings[index].type=='message')?
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 10),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     CachedNetworkImage(
  //                       imageUrl: _infoStrings[index].image,
  //                       imageBuilder: (context, imageProvider) => Container(
  //                         width: 32.0,
  //                         height: 32.0,
  //                         decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           image: DecorationImage(
  //                               image: imageProvider, fit: BoxFit.cover),
  //                         ),
  //                       ),
  //                     ),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Padding(
  //                           padding: const  EdgeInsets.symmetric(
  //                             horizontal: 8,
  //                           ),
  //                           child: Text(
  //                             _infoStrings[index].user,
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 14,
  //                                 fontWeight: FontWeight.bold
  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(height: 5,),
  //                         Padding(
  //                           padding: const  EdgeInsets.symmetric(
  //                             horizontal: 8,
  //                           ),
  //                           child: Text(
  //                             _infoStrings[index].message,
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 14
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               )
  //                   :null,
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

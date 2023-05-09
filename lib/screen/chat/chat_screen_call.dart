import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';

class ChatScreenCall extends StatefulWidget {
  const ChatScreenCall({Key? key}) : super(key: key);

  @override
  State<ChatScreenCall> createState() => _ChatScreenCallState();
}

class _ChatScreenCallState extends State<ChatScreenCall> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colors.black,
              child: Image.asset(
                'assets/image/ph_1.jpg',
                height: double.infinity,
              )),
          Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width / 1.6,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                              color:Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36))),
                          child: Image.asset('assets/image/voice_chat.png'),
                        ),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                              color:Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36))),
                          child: Image.asset('assets/image/microphon_chat.png'),
                        ),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                              color:Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36))),
                          child: Image.asset('assets/image/video_chat.png'),
                        ),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                              color: AppColors.colorApp,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36))),
                          child: Image.asset('assets/image/call_chat.png'),
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          ),
              )),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/ph_1.jpg'),
                    radius: 80.0,
                  ),
                ),
                //   CircleAvatar(child: Image.asset('assets/image/ph_1.jpg'),),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Natash Winkles',
                    style: TextStyle(color: Colors.white60,fontSize: 18),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '4:25 minutes',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

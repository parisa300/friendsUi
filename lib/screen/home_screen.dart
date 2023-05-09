import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/chat/chat_screen.dart';
import 'package:friends/screen/live_screen.dart';
import 'package:friends/screen/login_screen.dart';
import 'package:friends/screen/map_screen.dart';
import 'package:friends/screen/maps_screen.dart';
import 'package:friends/screen/model_item_gender.dart';
import 'package:friends/screen/profile_user_screen.dart';
import 'package:friends/screen/slider_screen.dart';
import 'package:friends/screen/tab_bar/like_screen.dart';
import 'package:friends/widget/custom_button.dart';
import 'package:friends/widget/custom_button_resent.dart';
import 'package:friends/widget/custom_list_gender.dart';
import 'package:friends/widget/custom_text_filed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController locationController = TextEditingController();


  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: appBar()),
          const Expanded(flex: 4, child: SliderScreen()),
        ],
      ),

      // appBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white24,
        currentIndex: 0, // this will be set when a new tab is tapped
        items:  [
          BottomNavigationBarItem(
            label: 'Home',
            icon: IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              onPressed: () {

                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) {
                //     return const SliderScreen();
                //   },
                // ));

              },
            ),
          ),
           BottomNavigationBarItem(
            label: 'Maps',
            icon: IconButton(
                icon:   const Icon(
                  Icons.map,
                  color: Colors.grey,
                ),
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return  MapScreen();
                    },
                  ));

                }

            ),


          ),
           BottomNavigationBarItem(
            label: 'Actions',
              icon: IconButton(
                icon:  const Icon(
                  Icons.pending_actions,
                  color: Colors.grey,
                ),
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return  const ActionScreen();

                    },
                  ));
                }

              ),
          ),

           BottomNavigationBarItem(

              icon:  IconButton(
                icon:  const Icon(
                  Icons.chat,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const ChatScreen();
                    },
                  ));

                },
              ),


              label: 'Chats'),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: IconButton(
              icon: const Icon(
                Icons.account_box_rounded,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ProfileUserScreen();
                  },
                ));

              },
            ),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36.0, left: 16),
          child: Expanded(
            flex: 1,
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 8),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Good Morning',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                'Andrew Anisley',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
                child: Image.asset('assets/image/setting.png')),
          ),
        ),
      ],
    );
  }
  void openBottomSheet() {

    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(alignment: Alignment.center,child: Text('Filter',style: TextStyle(),)),
                const SizedBox(height: 8),
                Container(height:1,color: Colors.grey,),
                const SizedBox(height: 8),
                const Text('Gender',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

         // Row(
         //   children: [
         //     Expanded(child: list_gender()),
         //   ],
         // ),
                const Text('Age',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                _rangeSlider(),
                const SizedBox(height: 8),
                const Text('Location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                const SizedBox(height: 8),
                CustomTextField(label: "",  controller: locationController),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButtonResent(
                        color: Colors.grey[200],

                        title: ('Reset'), onPressed: () {  },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButton(
                        color: AppColors.colorApp,
                        onPressed: () {

                        },
                        title: ('Apply'),
                      ),
                    )
                  ],
                ),
              ],),
          );

        });
  }
Widget list_gender(){
  var list = GenderProvider().getDepositList();
 return ListView.builder(
    itemCount: list.length,
   scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => Container(decoration: BoxDecoration(
      color: _selectedIndex==index ?AppColors.colorApp :Colors.white,
        border: Border.all(color: Colors.blue.shade300, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(16))
    ),
      // color: _selectedIndex != null && _selectedIndex == index
      //     ? Colors.red
      //     : Colors.white,
      child: ListTile(
        title: CustomListGender( item: list[index]),
        onTap: () => _onSelected(index),
      ),
    ),

  );
}
Widget _rangeSlider(){
  RangeValues _currentRangeValues = const RangeValues(30, 60);
  return RangeSlider(
    values: _currentRangeValues,
    max: 100,
    divisions: 5,
    labels: RangeLabels(
      _currentRangeValues.start.round().toString(),
      _currentRangeValues.end.round().toString(),
    ),
    onChanged: (RangeValues values) {
      setState(() {
        _currentRangeValues = values;
      });
    },
  );
}
}
